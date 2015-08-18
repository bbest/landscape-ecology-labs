---
title: "ESM 215 - Landscape Ecology, Winter 2015"
author: "Ben Best"
date: "Mar 9, 2014"
output:
  pdf_document:
    toc: yes
  html_document:
    keep_md: yes
    toc: yes
    toc_depth: 3
csl: _apa-single-spaced.csl
bibliography: _readings.bib
---

# Logistics

- Instructor: Ben Best (bbest@nceas.ucsb.edu)

- Meeting times and locations, from January 5th to March 12th, 2015.

    - Lecture: Tuesdays 2:30 - 3:45 in Bren Hall 1424 (classroom)

    - Lab: Thursdays 2:30 - 3:45 in Bren Hall 3035 (GIS lab)

    - Office hours: Tuesdays noon - 2pm in GIS lab or Bren 3524

- Required textbook:

    Turner, M. G., Gardner, R. H., & O’Neill, R. V. (2001). _Landscape Ecology
    in Theory and Practice: Pattern and Process_. New York: Springer.

# Overview

> The real voyage of discovery consists not in seeking new landscapes, but in
seeing with new eyes.
-- Marcel Proust

Rather than cataloguing the variety of landscapes or ecosystems on earth, the
field of Landscape Ecology (LE) provides methods to describe the interaction
between spatial patterns and ecological processes for any landscape. We'll begin
our "voyage of discovery" into this unique geographic perspective by exploring
scaling issues, causal agents (physical, biotic and human) and metrics to
quantify landscape pattern. Landscapes are hardly static, so understanding
disturbance regimes and impacts is essential. Then we'll build up from habitats
of individual species and connectivity across the landscape, to a multi-species
community perspective, culminating in evaluating conservation plans that
integrate LE concepts. Finally we'll review unique LE applications across
disperate ecosystems, including seascapes and soundscapes.

# Format

Our two weekly meeting times will be broken into lecture on Tuesdays in Bren
Hall 1424 and labs on Thursdays in the GIS lab.

## Lectures and Readings

Lectures (other than the first) will begin with a brief quiz on the assigned
readings from the primary literature (not the textbook chapters). For the last
15 minutes of lecture, these assigned readings will be discussed. Discussions
are to be led by one student per reading who will posit questions to the class,
with the possibility of using visual aids (eg PowerPoint presentation). It is
encouraged to highlight strengths and weaknesses in the paper, while providing
contextual relevance to landscape ecology fundamentals and modern conservation
applications. Students assigned to a reading can suggest an alternate reading up
to a week before the lecture. In order to be approved it must be relevant to
that week's lecture topic and be of sufficient quality.

For the remainder of lecture I will present concepts and examples from the
textbook and primary literature, welcoming questions and comments throughout for
a conversational tone.

## Labs and Group Project

Weekly labs will apply analytical techniques towards Santa Barbara County as the
backyard study area, and relate concepts from the preceding lecture. The first
two labs will orient you to ArcGIS and R while conducting tasks related to
assessing and forecasting landcover. I will provide introductions to these
software. Those with past experience are encouraged to help their neighbor with
less experience navigate the software (but not complete the assignment). Each
student will build distribution and connectivity models for different species,
all of which will be collated for use in the community lab.

The final conservation planning lab will be conducted as a group project. Each
group will present on a different objective in the final lab meeting and turn in
a report by the end of the following week.

During our scheduled Thursday lab sessions and besides the final lab reserved
for presentation of group projects, I will introduce labs briefly, leaving as
much time as possible to work through instructions and provide hands-on help.
Colored stickies slapped to the top of a monitor will let you quietly flag
whether you need help (red) or successfully completed a given step (green). Labs
are due the following Wednesday at noon.

## Field Trip

An optional weekend day trip to northern Santa Barbara County will allow us to
seek these LE patterns and processes in the field. You'll get extra credit for
attending and are encouraged to further sign up as a field guide by choosing a
topic (geology, fire, birds, trees, etc), creating a one page field guide
specific to Santa Barbara county and highlight objects on site.

In the modern vein of citizen science and crowd sourcing, expect to digitally
record species observations via GPS enabled camera (ie smartphone) for
submission to iNaturalist. Might enlist a quadcopter drone to capture aerial
photography for comparison with satellite data.

# Grading

item            |	points (% total) |  #  | total (% total)
----------------|-----------------:|:---:|---------------:
present reading |          5  (4%) |  1	 |   5   (4%)
quizzes	        |          3  (2%) |  9	 |  27  (20%)
labs	          |         10  (8%) |	8	 |  80  (61%)
group project	  |         20 (15%) |	1	 |  20  (15%)

Extra credit points:

- field trip:	 +3

- field guide: +3

# Makeup

Please notify me if you cannot attend or arrive late to a lecture. To make up
points for the quiz, you will need to provide a summary of the readings and
textbook chapters within the following week. You should define key concepts and
present overall results, and it must be limited to 1 page. Outline form is
acceptable.


# Schedule

## 1. Introduction

---------- ----------- ----------------------------------------
 _Jan  4_  _Lecture_   Introduction to Landscape Ecology:
                       history, overview

 _Jan  6_  _Lab_       Touring landcover using ArcGIS
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

 .         _Readings_  [@swanson_landform_1988; @davis_information_1990; @wu_landscape_2013]
                       [Turner ch 4]

 _Jan 22_  _Lab_       Physical controls on landscape vegetation using ArcGIS
---------- ----------- ----------------------------------------

## 4. Metrics

---------- ----------- ----------------------------------------
 _Jan 27_  _Lecture_   Landscape metrics:
                       geostatistics, fractals, percolation theory, neutral
                       models, fragmentation processes

 .         _Readings_  [@li_use_2004a; @swanson_landform_1988; @watt_pattern_1947]
                       [Turner ch 5 & 6]

 _Jan 29_  _Lab_       Measuring edge effects in the landscape using FragStats
---------- ----------- ----------------------------------------

## 5. Disturbance

---------- ----------- ----------------------------------------
 _Feb  3_  _Lecture_   Disturbance regimes:
                       processes, succession and metrics

 .         _Readings_  [@reice_nonequilibrium_1994; @romme_aspen_1995; @scheller_ecological_2007]
                       [Turner ch 7]

 _Feb  5_  _Lab_       Simulating fire regimes on forests using LANDIS
---------- ----------- ----------------------------------------

## 6. Species

---------- ----------- ----------------------------------------
 _Feb 10_  _Lecture_   Organisms and landscape pattern:
                       habitat selection, species distribution modeling

 .         _Readings_  [@robinson_pushing_2011; @elith_conservation_2009; @guisan_predicting_2013]
                       [Turner ch 3 & 8]

 _Feb 12_  _Lab_       Species distribution modeling using Maxent
---------- ----------- ----------------------------------------

## 7. Connectivity

---------- ----------- ----------------------------------------
 _Feb 17_  _Lecture_   Connectivity of organisms in the landscape:
                       species dispersal, metapopulation source-sink dynamics,
                       graph theory, landscape genetics, agent-based models

 .         _Readings_  [@with_analysis_2001; @mcrae_using_2008; @urban_graph_2009]
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

 _Feb 26_  _Lab_       Quantifying species diversity using Vegan in R
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

# Readings
<br>
