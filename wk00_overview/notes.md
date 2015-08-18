---
title: "Untitled"
author: "Ben Best"
date: "October 5, 2014"
output: html_document
---

- What of other simulation techniques, like EcoSim-EcoPath / [Madingley](http://theconversation.com/life-boils-down-to-five-rules-or-so-says-the-madingley-model-27819)?

seeing landscapes with these
ie a new way of seeing an existing landscape.

- Yellowstone: special focus b/c of history of fire regime, contention with wolf
- introductions, well documented trophic cascade, first national park, gorgeous
- place [[pic w/ buffalo]]

## Software

- ArcGIS 10.2.2
  - QGIS 2.4
- R 3.1.1
  - vegan 2.0-10
- CircuitScape 4.0

Missing:
- FragStats
- LANDIS
- Maxent
- Marxan

## 1. Introduction

---------- ----------- ----------------------------------------
_Jan  4_  _Lecture_   Introduction to Landscape Ecology:
history, overview

_Jan  6_  _Lab_       Touring Santa Barbara County landscapes using X-- Google Earth --X ArcGIS 10.2.2
---------- ----------- ---------------------------------------

## 2. Scale

---------- ----------- ----------------------------------------
_Jan 13_  _Lecture_   Scaling issues in space and time

.         _Readings_  [@urban_landscape_1987; @wiens_spatial_1989a; @chave_problem_2013]
[Turner ch 1 & 2]

_Jan 15_  _Lab_       Landuse change over time using a Markov model in R
---------- ----------- ----------------------------------------

## 3. Agents

---------- ----------- ----------------------------------------
_Jan 20_  _Lecture_   Agents of landscape pattern:
physical, biotic, human

.         _Readings_  [@swanson_landform_1988; @watt_pattern_1947; @wu_landscape_2013]
[Turner ch 4]

_Jan 22_  _Lab_       Physical controls on landscape vegetation using ArcGIS
---------- ----------- ----------------------------------------

## 4. Metrics

---------- ----------- ----------------------------------------
_Jan 27_  _Lecture_   Landscape metrics:
geostatistics, fractals, percolation theory, neutral
models, fragmentation processes

.         _Readings_  [@swanson_landform_1988; @watt_pattern_1947; @wu_landscape_2013]
[Turner ch 5 & 6]

_Jan 29_  _Lab_       Measuring edge effects in the landscape using FragStats
---------- ----------- ----------------------------------------

## 5. Disturbance

---------- ----------- ----------------------------------------
_Feb  3_  _Lecture_   Disturbance regimes:
processes, succession and metrics

.         _Readings_  [@reice_nonequilibrium_1994; @romme_aspen_1995; @scheller_ecological_2007]
[Turner ch 7]

_Feb  5_  _Lab_       Simulating fire regimes using LANDIS
---------- ----------- ----------------------------------------

## 6. Species

---------- ----------- ----------------------------------------
_Feb 10_  _Lecture_   Organisms and landscape pattern:
habitat selection, species distribution modeling

.         _Readings_  [@hutchinson_concluding_1957; @elith_conservation_2009; @guisan_predicting_2013]
[Turner ch 3 & 8]

_Feb 12_  _Lab_       Species distribution modeling using Maxent
---------- ----------- ----------------------------------------

## 7. Connectivity

---------- ----------- ----------------------------------------
_Feb 17_  _Lecture_   Connectivity of organisms in the landscape:
species dispersal, metapopulation source-sink dynamics,
graph theory, landscape genetics, agent-based models

.         _Readings_  [@with_analysis_2001; @mcrae_using_2008a; @urban_graph_2009]
[Turner ch 8]

_Feb 19_  _Lab_       Connectivity modeling using Circuitscape
---------- ----------- ----------------------------------------

## 8. Communities

---------- ----------- ----------------------------------------
_Feb 24_  _Lecture_   Communities:
species-area curves, island biogeography, beta gradients,
diversity metrics, trophic interactions

.         _Readings_  [@urban_extending_2002; @fortin_wolves_2005c; @lamanna_functional_2014]
[Turner ch 9]

_Feb 26_  _Lab_       Quantifying species diversity using Vegan
---------- ----------- ----------------------------------------

## 9. Planning

---------- ----------- ----------------------------------------
_Mar  3_  _Lecture_   Conservation planning in the context of landscape ecology:
ecosystem services, coupled social-ecological systems,
compensatory mitigation, climate change

.         _Readings_  [@degroot_challenges_2010a; @nelson_modeling_2009; @watson_systematic_2011]
[Turner ch 10]

_Mar  5_  _Lab_       Conservation planning using Marxan (group project)
---------- ----------- ----------------------------------------


## 10. Applications

---------- ----------- ----------------------------------------
_Mar 10_  _Lecture_   Case studies across
urban, agricultural and coastal ecosystems,
sustainable forestry, urban-wildland interface, future directions

.         _Readings_  [@grimaldi_ecosystem_2014; @rouget_designing_2006; @thompson_biodiversity_2014]
[Turner ch 10 & 11]

_Mar 12_  _Lab_       Group project presentations
---------- ----------- ----------------------------------------


---



# OLD Schedule

# Resources

* [Syllabus with Readings](./syllabus.csv)
* [News forum](https://archive.gauchospace.ucsb.edu/gs20082011/thearchive/mod/forum/view.php?id=67436)

The dates of winter quarter are January 5 - March 13. Exam week will be March
16-20. Typically, a 4-unit course such as ESM 215 is offered twice a week for 1
hour and 15 minutes each class session for the 10-week quarter. With a
lab-intensive course, you may want to adjust the meeting schedule a bit to
accommodate additional lab time.


## Wk 1: Intro

Jan 6, 8

overview, history, land use classifications

classic srxr:
 - agents of pattern: physical, biotic, disturbance
 - scale: hierachies in space & time, issues
 - quantifying pattern: metrics, geostatistics

Lab: Google Earth tour of Santa Barbara County

---

Introduction to Landscape Ecology: Patch dynamics, scale and hierarchy, the landscape as a unit of analysis and management

* [Introduction to Landscape Ecology](./wk01/README.md)
* [Course overview](https://archive.gauchospace.ucsb.edu/gs20082011/thearchive/mod/resource/view.php?id=74603)
* [Exercise 1](./wk01/ex01.md)  


## Wk 2: Scale

Jan 13, 15

Scaling issues in space and time

Deforestation (REDD), UMD dataset

Lab: Land use change over time and forecast with Markov model. Compare at diff't scales.



---

Pattern and Process in Ecological Systems: Ecological space-time hierarchies, spatial ecological interactions across landscapes and regions

* [Pattern and Process in Ecological Systems](./wk02/README.md)
* [Week 2 lecture notes](./wk02/wk02.ppt)
* [Exercise 2: Physical controls on landscape vegetation pattern](./wk02/ex02.md)


## Wk 3: Agents

Jan 20, 22

Agents of Landscape Pattern: abiotic, biotic, human

Lab: [Physical controls on landscape vegetation pattern](./wk02/ex02.md)

---

Disturbance regimes: disturbance processes, dynamic disturbance mosaics, describing and modeling disturbance regimes at the landscape scale.

* [Disturbance regimes](https://archive.gauchospace.ucsb.edu/gs20082011/thearchive/mod/resource/view.php?id=80725)
* [Week 3 notes](https://archive.gauchospace.ucsb.edu/gs20082011/thearchive/mod/resource/view.php?id=81836)


## Wk 4: Disturbance

Jan 27, 29

Disturbance regimes: disturbance processes, dynamic disturbance mosaics, describing and modeling disturbance regimes at the landscape scale. Interactions between land use change and fire regimes; metrics for quantifying changes in landscape patterns

succession in forests.

intermediate disturbance (Connel) in marine / coastal.


Lab: [Simulating fire regimes](https://archive.gauchospace.ucsb.edu/gs20082011/thearchive/mod/assignment/view.php?id=82409)

---

Disturbance Regimes, Part 2: Interactions between land use change and fire regimes; metrics for quantifying changes in landscape patterns.

* [Characterizing disturbance regimes](https://archive.gauchospace.ucsb.edu/gs20082011/thearchive/mod/resource/view.php?id=82408)
* [Exercise 3. Simulating fire regimes; measuring landscape pattern.](https://archive.gauchospace.ucsb.edu/gs20082011/thearchive/mod/assignment/view.php?id=82409)
* [Notes on landscape pattern metrics](https://archive.gauchospace.ucsb.edu/gs20082011/thearchive/mod/resource/view.php?id=82651)


## Wk 5: Metrics

Feb 3, 5

Edge effects in landscape patch mosaics: mechanisms, models and case studies.

Geostatistics. fractals, neutral models.

Lab: [Edge effects in the landscape](https://archive.gauchospace.ucsb.edu/gs20082011/thearchive/mod/assignment/view.php?id=85798). Fragstats & geostats. Compare with Neutral model / percolation.  Fractals.


Reading: Turner bk Ch 5, 6

---

* [Edge effects in the landscape](https://archive.gauchospace.ucsb.edu/gs20082011/thearchive/mod/resource/view.php?id=83399)
* [Notes on ecological edge effects](https://archive.gauchospace.ucsb.edu/gs20082011/thearchive/mod/resource/view.php?id=84078)
* [Exercise 4: Edge effects in the landscape](https://archive.gauchospace.ucsb.edu/gs20082011/thearchive/mod/assignment/view.php?id=85798)


## Wk 6: Species

Feb 10, 12

Organisms and Landscape Pattern Part 1: Individuals and single species populations

Lab: Species Distribution Model with Maxent

---

Organisms and Landscape Pattern Part 1: Individuals and single species populations

* [Movement of individuals and population dispersal in heterogeneous landscapes](https://archive.gauchospace.ucsb.edu/gs20082011/thearchive/mod/resource/view.php?id=84909)
* [Notes on organisms in the landscape](https://archive.gauchospace.ucsb.edu/gs20082011/thearchive/mod/resource/view.php?id=85399)


## Wk 7: Connectivity

Feb 17, 19

Connectivity, dispersal, metapopulations, source-sink dynamics

percolation theory (connected at p=0.5928 per Stauffer 1985)

agent based models

Literature:

Pulliam 2000

Lab: Circuitscape

---

Populations, communities, and landscape pattern

* [Habitat Fragmentation and Biodiversity](https://archive.gauchospace.ucsb.edu/gs20082011/thearchive/mod/resource/view.php?id=86131)
* [Note on habitat fragmentation and diversity](https://archive.gauchospace.ucsb.edu/gs20082011/thearchive/mod/resource/view.php?id=87380)
* [Modeling habitat connectivity for wildlife species](https://archive.gauchospace.ucsb.edu/gs20082011/thearchive/mod/assignment/view.php?id=87541)


## Wk 8: Communities

Feb 24, 26

Populations, communities, and landscape pattern, island biogeography, species richness, trophic interactions.

beta diversity, food webs / trophic cascades

Lab: ? EcoSim/EcoPath, HexSim..., Species richness vs rarity, Shannon's diversity index, calculating beta diversity, vegan ordination ?

---

Urban and Regional Planning

* [Ecological landscape planning](https://archive.gauchospace.ucsb.edu/gs20082011/thearchive/mod/resource/view.php?id=87552)
* [Notes on regional planning](https://archive.gauchospace.ucsb.edu/gs20082011/thearchive/mod/resource/view.php?id=88358)
* [ESM 215 Exercise 6: Assessing environmental impacts of a build-out scenario on Burton Mesa](https://archive.gauchospace.ucsb.edu/gs20082011/thearchive/mod/assignment/view.php?id=88928)


## Wk 9: Planning

Mar 3, 5

ecosystem based management, ecosystem services, land-water-sea interactions, genetics

Lab: ? GenGIS, INVeST, Marxan for conservation planning

---

Agroecosystems

* [Landscape ecology and sustainable agroecosystems](https://archive.gauchospace.ucsb.edu/gs20082011/thearchive/mod/resource/view.php?id=88836)
* [Notes on landscape ecology and agroecosystems](https://archive.gauchospace.ucsb.edu/gs20082011/thearchive/mod/resource/view.php?id=89571)


## Wk 10: Applications

Mar 10, 12

Lecture: Applications in urban, agroecosystems, and coastal. sustainable land mgmt: renewables, deforestation / REDD / Kyoto

Lab: Final Exam

---

Landscape restoration

* [Landscape restoration](https://archive.gauchospace.ucsb.edu/gs20082011/thearchive/mod/resource/view.php?id=90433)
* [Notes on landscape restoration](https://archive.gauchospace.ucsb.edu/gs20082011/thearchive/mod/resource/view.php?id=90783)


## Week 11

class done already

---

Mar 15 - 21

Ecosystem-based management
