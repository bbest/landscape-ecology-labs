Hi Ben,

http://www.landis-ii.org

Scott Leibowitz is the guy I mentioned. The paper is Leibowitz SG, Loehle C, Li B-L, and Preston EM. 2000. Modeling
landscape functions and effects: a network approach. Ecol Model 132: 77–94.

I added you as a course visitor to ESM 215, last taught in winter 2010. Not sure whether this works for archived courses.

Cheers,
FD


On Fri, Aug 15, 2014 at 12:27 PM, Benjamin Best <bdbest@gmail.com> wrote:
Hi Frank,

Thanks again for recommending me to Satie for teaching Landscape Ecology. I'm excited to teach this course. Would love to peruse your past materials on GauchoSpace. My username is bbest.

I'm curious which of these LANDIS software packages you used?
http://www.landis-ii.org
http://www.landislab.ent.msu.edu
Who was at the EPA and carefully described flow of nutrients and resources?

Thanks so much, Ben

Other notes:
CircuitScape (McRae et al 2008; McRae et al 2012): connectivity (Moilanen & Nieminen 2002), graph structures, metapopulation dynamics. ConnMod.
Urban Growth (Keith Clark), eg for SB (Clark & Gaydos 2001; Herold et al 2003; Herold et al 2005; Sante et al 2010; Ramachandra et al 2012)
SB case study for land and sea. Ridges to Reefs (Possingham and Klein)
FragStats
Open source LE s/w: R for Landscape Ecology, Steiniger & Hay (2010) review
R CRAN Task Views: Spatial, Environmetrics
LE lit review: Journal of LE - most cited papers, key concepts (Wu 2013), pattern analysis tools

http://simecol.r-forge.r-project.org/

```r
# The classical Conway's Game of Life
library("simecol")
data(conway, package="simecol")
plot(sim(conway))
m <- matrix(0, 40, 40)
m[5:35,19:21] <-1
init(conway) <- m
sim(conway, animate=TRUE, delay=100, col=c("white", "green"), axes=FALSE) 
```


- [Robert Costanza pubs](http://scholar.google.com/citations?user=EQ-mkaAAAAAJ&hl=en&oi=sra)

- agent based modeling

Readings

Turner, M. G. et al. 1993. [A revised concept of landscape equilibrium: disturbance and stability on scaled landscapes](../readings/Turner_1993.pdf). LandscapeEcology 8:213-227.

Gill, M.A. and S. L. Stephens. 2009. [Scientific and social challenges for the management of fire-prone wildland–urban interfaces](../readings/Gill_2009.pdf). Environ. Res. Letters.

Gustafson, E. 1998. [Quantifying landscape spatial pattern: what is the state of the art?](../readings/Gustafson_1998.pdf) Ecosystems 1:143-156.

Exercise 3. In this exercise you will begin to explore modeling of disturbance regimes using Landis. There is no assignment to hand in for Parts 1 and 2, but come to lab on Wednesday prepared to discuss your findings. In Part 3 (to be provided in lab) you will be analyzing your Landis outputs using fragstats pattern metric software.