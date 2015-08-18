# NOTE: This script has already been run for you. It's simply here for your 
# edification and possible future reuse.

# set working directory ----
wd = 'H:/esm215/lab9_planning' # wd = '/Users/bbest/github/landscape-ecology/wk09_planning/lab9_planning'
setwd(wd)

# load libraries ----
suppressPackageStartupMessages(suppressWarnings({
  library(stringr)
  library(sp)
  library(rgdal)
  library(raster)
  library(rgeos)
  library(dismo)
  library(dplyr)
  library(tidyr)  
  library(knitr)
  if (!require(rgbif)){
    devtools::install_github('ropensci/rgbif')
    library(rgbif)
  }    
}))

# generate maxent results ----

# vars
spp           = read.csv('spp/_lab6_species.csv')
csv_extent    = sprintf('spp/_extent.csv')
env_in        = 'H:/esm215/lab6_species/env/current_10min_global'
env_sb_now    = 'H:/esm215/lab6_species/env/current_0.5min_sb'
env_sb_future = 'H:/esm215/lab6_species/env/future_0.5min_sb'
maxent_jar    = 'H:/esm215/lab6_species/software/maxent.jar'

jet_colors = colorRampPalette(
  c("#00007F", "blue", "#007FFF", "cyan",
    "#7FFF7F", "yellow", "#FF7F00", "red", "#7F0000")) # (256)

for (i in 1:nrow(spp)){ # i=1
  
  # set variables
  sp_scientific    = paste(str_split(spp$scientific[i], ' ')[[1]][1:2], collapse=' ')
  sp_nospace       = str_replace_all(sp_scientific, ' ', '_')
  csv_gbif         = sprintf('spp/%s_gbif.csv'  , sp_nospace)  
  csv_train        = sprintf('spp/%s_train.csv' , sp_nospace)
  csv_test         = sprintf('spp/%s_test.csv'  , sp_nospace)
  png_gbif         = sprintf('spp/%s_gbif.png', sp_nospace)
  png_test_train   = sprintf('spp/%s_test-train.png', sp_nospace)
  png_env          = sprintf('spp/%s_env.png', sp_nospace)
  png_maxent_sb_now    = sprintf('spp/%s_maxent-sb-current.png', sp_nospace)
  png_maxent_sb_future = sprintf('spp/%s_maxent-sb-future.png', sp_nospace)
  png_maxent_sb_dif    = sprintf('spp/%s_maxent-sb-future-current.png', sp_nospace)
  env_out          = sprintf('spp/%s_env_current_10min_cropped' , sp_nospace)
  maxent_out       = sprintf('%s/spp/%s_maxent', wd, sp_nospace)
  maxent_sb_now    = sprintf('%s/%s_current0.5min_sb.bil', maxent_out, sp_nospace)
  txt_threshold    = sprintf('%s/spp/%s_threshold.txt', wd, sp_nospace)
  maxent_sb_future = sprintf('%s/%s_future0.5min_sb.bil', maxent_out, sp_nospace)
  
  if (!file.exists(csv_gbif)){
    attempts = 0
    while (attempts < 10){
      res = try({
        key = name_suggest(q=sp_scientific, rank='species')$key[1]
        d_gbif = occ_search(
          taxonKey=key, limit=1000, 
          hasCoordinate=T, spatialIssues=F,
          return='data')        
      })
      if ('try-error' %in% class(res)){
        attempts = attempts + 1
      } else {
        break
      }
    }
    
    # filter out zero coordinates
    d_gbif = filter(d_gbif, !(decimalLatitude==0 & decimalLongitude==0))
    
    # write csv from raw GBIF output
    write.csv(d_gbif, csv_gbif, row.names=F, na='')
  } else {
    d_gbif = read.csv(csv_gbif)
  }
  
  # plot map of original GBIF points
  if (!file.exists(png_gbif)){
    pts_gbif = d_gbif
    coordinates(pts_gbif) = ~decimalLongitude+decimalLatitude 
    map_gbif = gmap(pts_gbif, lonlat=T)
    png(sprintf('spp/%s_gbif.png', sp_nospace))
    plot(map_gbif, main=sp_scientific)
    points(pts_gbif, pch=16, col=rgb(1, 0, 0, alpha=0.5), cex=0.5)
    dev.off()
  }
  
  if ((!file.exists(csv_train) | !file.exists(csv_test))){
    
    # get columns used by Maxent, filter based on drawn extent
    e = as.matrix(extent_filter)
    d = d_gbif %>%
      mutate(
        species = sp_scientific) %>%
      select(
        species,
        lon = decimalLongitude,
        lat = decimalLatitude) %>%
      filter(
        lon > e['x','min'],
        lon < e['x','max'],
        lat > e['y','min'],
        lat < e['y','max'])
    
    # skip species if not at least 50 rows after filtering
    if (nrow(d) < 50){
      next
    }
    
    # for Maxent, withold 20% sample for testing 
    fold = kfold(d, k=5)
    write.csv(d[fold==1, ], csv_test, row.names=F, na='')
    write.csv(d[fold!=1, ], csv_train, row.names=F, na='')
  }
  
  # read in test and train data
  d = rbind(
    read.csv(csv_test) %>%
      mutate(partition='test'),
    read.csv(csv_train) %>%
      mutate(partition='train'))
  
  # plot map of test and train pts
  if (!file.exists(png_test_train)){
    png(png_test_train)
    pts = d
    coordinates(pts) = ~lon+lat
    map_pts <- gmap(pts, lonlat=T)
    plot(map_pts)
    points(pts %>% subset(partition=='train'), 
           pch=16, col=rgb(1, 0, 0, alpha=0.4), cex=0.5)
    points(pts %>% subset(partition=='test') , 
           pch=16, col=rgb(0, 0, 1, alpha=0.4), cex=0.5)
    legend('bottomleft', c('train','test'), 
           pch=16, col=c(rgb(1, 0, 0, alpha=0.4), rgb(0, 0, 1, alpha=0.4)), cex=0.5)
    
    extent_filter = extent(as.vector(t(read.csv(csv_extent))))
    plot(extent_filter, col='red', add=T)
    dev.off()
  }
  
  # crop rasters to extent of point observations, expanded 5% from points
  if (!file.exists(env_out)){
    dir.create(env_out, showWarnings=F)
    e = as.matrix(extent(pts))
    extent_crop = c(extendrange(e['x',], f=0.05), extendrange(e['y',], f=0.05)) %>% extent()  
    for (bil_in in list.files(env_in, '.*\\.bil$', full.name=T)){
      bil_out = file.path(env_out, basename(bil_in))
      if (!file.exists(bil_out)){
        r = crop(raster(bil_in), extent_crop)
        writeRaster(r, bil_out, datatype='INT2S', overwrite=T)
      }
    }
  }
  
  # plot env
  if (!file.exists(png_env)){
    png(png_env, width=1200, height=1600)
    bils = list.files(env_out, '.*\\.bil$', full.names=T)
    s = stack(bils)
    plot(s, col=jet_colors)  
    dev.off()
  }
  
  # run maxent
  dir.create(maxent_out, showWarnings=F)
  
  
  if (!file.exists(maxent_sb_future)){
    # run maxent, like lab6/scenario_02 model
    cmd = sprintf(
      'java -mx6000m -jar "%s" nowarnings noprefixes responsecurves redoifexists autorun outputfiletype=bil outputdirectory="%s" samplesfile="%s" environmentallayers="%s" testsamplesfile="%s"', 
      maxent_jar, maxent_out, csv_train, env_out, csv_test)
    system(cmd)  
    
    # project maxent to fine-scale SB, current climate
    lambdaFile = sprintf('%s/%s.lambdas', maxent_out, sp_nospace)
    cmd = sprintf('java -cp "%s" density.Project "%s" "%s" "%s"', maxent_jar, lambdaFile, env_sb_now, maxent_sb_now)
    system(cmd)
    
    # project maxent to fine-scale SB, future climate
    cmd = sprintf('java -cp "%s" density.Project "%s" "%s" "%s"', maxent_jar, lambdaFile, env_sb_future, maxent_sb_future)    
    system(cmd)
  }
  
  if (!file.exists(png_maxent_sb_future)){
    r_c = raster(maxent_sb_now, crs=CRS('+proj=longlat +datum=WGS84'))
    r_f = raster(maxent_sb_future, crs=CRS('+proj=longlat +datum=WGS84'))
    
    d = data.frame(
      prob_encounter = getValues(r_c),
      area_cell_km2  = getValues(area(r_c))) %>%
      arrange(desc(prob_encounter)) %>%
      na.omit() %>%
      mutate(area_cum_km2 = cumsum(area_cell_km2)) %>%  
      mutate(area_pct = area_cum_km2 / last(area_cum_km2))
    
    d$area_cum_km2 = cumsum(d$area_cell_km2)
    d$area_pct = d$area_cum_km2 / last(d$area_cum_km2)
    
    i = which.max(d$area_pct > 0.20)
    n = nrow(d)
    threshold = d$prob_encounter[i]
    
    r_c_b = r_c >= threshold # plot(r_c_b, legend=F)
    r_f_b = r_f >= threshold
    r = setValues(r_c, NA)
    r[r_c_b==T & r_f_b==T] = 0
    r[r_c_b==F & r_f_b==T] = 1
    r[r_c_b==T & r_f_b==F] = -1
    setValues(r, factor(getValues(r), c(-1,0,1), c('lost','core','novel')))
    
    d_c_f = zonal(area(r), r, 'sum') %>% 
      as.data.frame() %>%
      select(zone, area_km2 = sum) %>%
      mutate(pct = area_km2 / sum(area_km2) * 100)
    
    writeLines(as.character(threshold), txt_threshold)
    
    png(png_maxent_sb_now)
    plot(r_c_b, main=sprintf('%s in Current SB Climate', sp_scientific), legend=F)
    dev.off()
    
    png(png_maxent_sb_future)
    plot(r_f_b, main=sprintf('%s in Future SB Climate', sp_scientific), legend=F)
    dev.off()
    
    png(png_maxent_sb_dif)
    plot(r, col=c('red','blue','green'), main=sprintf('%s Future - Current', sp_scientific))
    dev.off()
  }
  
}

# create planning unit hexagons ----

# paths
tif_nlcd = 'H:/esm215/lab1_intro/rasters/nlcd_2011.tif'
shp_cnty = 'H:/esm215/lab2_scale/vector/county_bnd'
shp_pu   = 'data/pu'

if (!file.exists(sprintf('%s.shp', shp_pu))){
  
  # read NLCD that has Albers projection
  r_nlcd = raster(tif_nlcd) # plot(r_nlcd['Value'])
  
  # read in SB county and transform to NLCD Albers projection
  cnty = spTransform(readOGR(dirname(shp_cnty), basename(shp_cnty)), crs(r_nlcd))
  
  # create hexagons
  hex_pts  = spsample(cnty, type='hexagonal', cellsize=4000)
  hex_pols = HexPoints2SpatialPolygons(hex_pts)
  h = SpatialPolygonsDataFrame(
    hex_pols, 
    data.frame(
      'id'=1:length(hex_pols), 
      'area_km2' = area(hex_pols)/(1000*1000)), match.ID=F)
  #length(h) # 472 for cellsize 4000; area is 13.85641 km2
  
  # write hexagons to shapefile
  writeOGR(h, dirname(shp_pu), basename(shp_pu), driver='ESRI Shapefile', verbose=F)
  
} else {
  
  # read hexagons shapefile
  h = readOGR(dirname(shp_pu), basename(shp_pu)) 
}

# plot ids
spplot(h['id'], main='Planning Unit ID')
```

# extract spp to hexagons ----

# loop through available Maxent species distribution models for SB current climate
for (bil in list.files('spp', '.*_current0\\.5min_sb\\.bil', full.names=T, recursive=T)){
  # bil = list.files('spp', '.*_current0\\.5min_sb\\.bil', full.names=T, recursive=T)[1]
  sp_scientific = paste(str_split(basename(bil), '_')[[1]][1:2], collapse=' ') 
  sp_nospace    = str_replace_all(sp_scientific, ' ', '_')
  
  # read species maxent raster for [c]urrent SB climate, and apply [b]inary threshold
  r_c = raster(bil, crs=CRS('+proj=longlat +ellps=WGS84'))
  threshold = as.numeric(readLines('spp/Amphispiza_belli_threshold.txt'))
  r_c_b = r_c >= threshold # plot(r_c_b)
  
  # add mean extracted value, ie proportion of hexagon as habitat
  h@data[sp_nospace] = unlist(lapply(
    raster::extract(r_c_b, h), 
    function(x){
      if (!is.null(x)){
        x[is.na(x)] = 0
        mean(x)
      } else {
        NA
      }})) #spplot(h[sp_nospace], main=sp_scientific)
}

# marxan file paths
dir.create('scenario1', showWarnings=F)
csv_spp       = 'scenario_01/spp.csv'
csv_pu_vs_spp = 'scenario_01/pu_vs_spp.csv'
csv_pu        = 'scenario_01/pu.csv'
csv_boundary  = 'scenario_01/boundary.csv'

# spp.csv: id, prop, spf, name
col_spp = 3:ncol(h)
data.frame(
  id = 1:length(col_spp),
  prop = 0.2,
  spf = 1,
  name = str_replace(names(h@data[col_spp]), '_', ' ')) %>%
  arrange(id) %>%
  write.csv(csv_spp, row.names=F)

# pu_vs_spp.csv: species, pu, amount
spp_col2id = setNames(3:ncol(h) - 2, names(h@data[col_spp]))
h@data[,c(1,col_spp)] %>%
  gather(sp_nospace, amount, -id) %>%
  mutate(species = spp_col2id[sp_nospace]) %>%  
  select(species, pu=id, amount) %>%
  filter(amount!=0) %>% # Marxan expects to not see rows with 0 amount
  arrange(species, pu) %>%
  write.csv(csv_pu_vs_spp, row.names=F)

# pu.csv: id, cost, status, xloc, yloc
h@data %>%
  mutate(
    cost = 1,
    status = 0,
    xloc = coordinates(h)[,1],
    yloc = coordinates(h)[,2]) %>%
  select(id, cost, status, xloc, yloc) %>%
  arrange(id) %>%
  write.csv(csv_pu, row.names=F)

# boundary.csv
s = gLength(subset(h, id==1))/6 # length of one side of hexagon in meters
m = gTouches(h, byid=T)         # matrix [n_hexagons X n_hexagons] of T/F touches
m[lower.tri(m, diag=T)] = NA    # set upper triangle to NA since repeats lower
d = cbind(
  id1 = 1:nrow(m),
  data.frame(m))
names(d) = c('id1', as.character(1:nrow(m)))
d %>%    
  gather(id2, touches, -id1) %>%
  filter(touches==T) %>%
  mutate(boundary=1) %>%
  select(id1, id2, boundary) %>%
  arrange(id1, id2) %>%
  write.csv(csv_boundary, row.names=F)

# TODO: add sepdistance to spp.csv (uses xloc,yloc in pu.csv)
# TODO: explain Connectivity scores in output_sum.txt

# write to shapefile
h@data = h@data[,'id',drop=F]
writeOGR(h, dirname(shp_pu), basename(shp_pu), driver='ESRI Shapefile', verbose=F, overwrite_layer=T)

# limit_reorder_scenario_1 ----

# setup folder
dir_input = 'scenario_10/input'
dir.create(dir_input, showWarnings=F, recursive=T)

# get species slotted to students
spp = read.csv('spp/_lab6_species.csv', na.strings='') %>%
  filter(!is.na(student)) %>%
  mutate(genus_species = sprintf('%s %s', genus, species)) %>%
  merge(read.csv('scenario_1/input/spp.csv'), by.x='genus_species', by.y='name') %>%
  mutate(
    target = 5,
    spf    = 10) %>%
  select(id_old=id, target, spf, name=genus_species) %>%
  arrange(name) %>%
  mutate(id = row_number())
write.csv(select(spp, id, target, spf, name), sprintf('%s/spp.csv', dir_input), row.names=F)

# pu_vs_spp: filter to student species and order by pu
read.csv('scenario_1/input/pu_vs_spp.csv') %>%  
  filter(species %in% spp$id_old) %>%
  merge(spp[,c('id_old','id')], by.x='species', by.y='id_old') %>%
  select(species=id, pu, amount) %>%
  arrange(pu, species) %>%
  write.csv(sprintf('%s/pu_vs_spp.csv', dir_input), row.names=F)