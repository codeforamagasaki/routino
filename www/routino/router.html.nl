<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>

<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta name="keywords" content="openstreetmap routing route planner 車椅子 経路探索 ルート検索 C4AMA CodeforAmagasaki コードフォーアマガサキ OSM オープンデータ">
<meta name="viewport" content="width=device-width, height=device-height, initial-scale=1, user-scalable=no">

<title>Routino : Route Planner for OpenStreetMap Data</title>

<!--
Routino router web page.

Part of the Routino routing software.

This file Copyright 2008-2015 Andrew M. Bishop

This program is free software: you can redistribute it and/or modify
it under the terms of the GNU Affero General Public License as published by
the Free Software Foundation, either version 3 of the License, or
(at your option) any later version.

This program is distributed in the hope that it will be useful,
but WITHOUT ANY WARRANTY; without even the implied warranty of
MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE. See the
GNU Affero General Public License for more details.

You should have received a copy of the GNU Affero General Public License
along with this program. If not, see http://www.gnu.org/licenses/.
-->

<!-- Page elements -->
<script src="page-elements.js" type="text/javascript"></script>
<link href="page-elements.css" type="text/css" rel="stylesheet">

<!-- Router and visualiser shared features -->
<link href="maplayout.css" type="text/css" rel="stylesheet">

<!-- Router specific features -->
<script src="profiles.js" type="text/javascript"></script>
<link href="router.css" type="text/css" rel="stylesheet">

<!-- Map parameters -->
<script src="mapprops.js" type="text/javascript"></script>

<!-- Map loader -->
<script src="maploader.js" type="text/javascript"></script>

</head>
<body onload="map_load('html_init();map_init();form_init();');">

<!-- Left hand side of window - data panel -->

<div class="left_panel">

<div class="tab_box">
<span id="tab_options" onclick="tab_select('options');" class="tab_selected" title="Set routing options">Opties</span>
<span id="tab_results" onclick="tab_select('results');" class="tab_unselected" title="See routing results">Resultaten</span>
<span id="tab_data" onclick="tab_select('data');" class="tab_unselected" title="View database information">Data</span>
</div>

<div class="tab_content" id="tab_options_div">

<form name="form" id="form" action="#" method="get" onsubmit="return false;">
<div class="hideshow_box">
<span class="hideshow_title">Routino OpenStreetMap Router</span>
Zoom naar straatniveau.
Selecteer start- and eindpunten onder Coordinaten. (click op het marker
icoon links, schuif het op map naar gewenste positie).
<div class="center">
<a target="other" href="http://www.routino.org/">Routino Website</a>
|
<a target="other" href="documentation/">Documentation</a>
</div>
</div>

<div class="hideshow_box">
<span id="hideshow_language_show" onclick="hideshow_show('language');" class="hideshow_show">+</span>
<span id="hideshow_language_hide" onclick="hideshow_hide('language');" class="hideshow_hide">-</span>
<span class="hideshow_title">Taal</span>

<div id="hideshow_language_div" style="display: none;">
<table>
<tr>
<td><a id="lang_en_url" href="router.html.en" title="English language webpage">English</a>
<td>(EN)
<td><input name="language" type="radio" value="en" onchange="formSetLanguage();" >
<tr>
<td><a id="lang_de_url" href="router.html.de" title="Deutsche Webseite">Deutsch</a>
<td>(DE)
<td><input name="language" type="radio" value="de" onchange="formSetLanguage();" >
<tr>
<td><a id="lang_fr_url" href="router.html.fr" title="Page web en français">Français</a>
<td>(FR)
<td><input name="language" type="radio" value="fr" onchange="formSetLanguage();" >
<tr>
<td><a id="lang_hu_url" href="router.html.hu" title="Magyar weblap">Magyar</a>
<td>(HU)
<td><input name="language" type="radio" value="hu" onchange="formSetLanguage();" >
<tr>
<td><a id="lang_ja_url" href="router.html.ja" title="日本語ウェブページ">日本語</a>
<td>(JA)
<td><input name="language" type="radio" value="ja" onchange="formSetLanguage();" >
<tr>
<td><a id="lang_nl_url" href="router.html.nl" title="Nederlandse web pagina">Nederlands</a>
<td>(NL)
<td><input name="language" type="radio" value="nl" onchange="formSetLanguage();" checked>
<tr>
<td><a id="lang_pl_url" href="router.html.pl" title="Polski webpage">Polski</a>
<td>(PL)
<td><input name="language" type="radio" value="pl" onchange="formSetLanguage();" >
<tr>
<td><a id="lang_ru_url" href="router.html.ru" title="Русский">Русский</a>
<td>(RU)
<td><input name="language" type="radio" value="ru" onchange="formSetLanguage();" >
</table>
<a target="translation" href="http://www.routino.org/translations/">Routino Translations</a>
</div>
</div>

<div class="hideshow_box">
<span id="hideshow_waypoint_show" onclick="hideshow_show('waypoint');" class="hideshow_hide">+</span>
<span id="hideshow_waypoint_hide" onclick="hideshow_hide('waypoint');" class="hideshow_show">-</span>
<span class="hideshow_title">Coordinaten</span>
<div id="hideshow_waypoint_div">
<div id="waypoints">
<div id="waypointXXX" class="waypoint" style="display: none;">
<img id="iconXXX" class="waypoint-icon" src="icons/marker-XXX-grey.png" title="Waypoint XXX Position" alt="Waypoint XXX" onmouseup="markerToggleMap(XXX);" draggable="true">
<span id="coordsXXX">
<input name="lonXXX" type="text" size="7" title="Waypoint XXX Longitude" onchange="formSetCoords(XXX);">E
<input name="latXXX" type="text" size="7" title="Waypoint XXX Latitude" onchange="formSetCoords(XXX);">N
</span>
<span id="searchXXX" style="display: none;">
<input name="searchXXX" type="text" size="18" title="Waypoint XXX Location"> <!-- uses Javascript event for triggering -->
</span>
<div class="waypoint-buttons" style="display: inline-block;">
<img alt="?" src="icons/waypoint-search.png" title="Search for location" onmousedown="markerSearch(XXX);" >
<img alt="G" src="icons/waypoint-locate.png" title="Get current location" onmousedown="markerLocate(XXX);" >
<img alt="O" src="icons/waypoint-recentre.png" title="Centre map on this waypoint" onmousedown="markerRecentre(XXX);">
<img alt="^" src="icons/waypoint-up.png" title="Beweeg dit punt naar boven" onmousedown="markerMoveUp(XXX);" >
<img alt="+" src="icons/waypoint-add.png" title="Voeg hierna punt toe" onmousedown="markerAddAfter(XXX);">
<br>
<img alt="#" src="icons/waypoint-coords.png" title="Coordinates for location" onmousedown="markerCoords(XXX);" >
<img alt="~" src="icons/waypoint-home.png" title="Toggle als thuis locatie" onmousedown="markerHome(XXX);" >
<img alt="o" src="icons/waypoint-centre.png" title="Centreer dit punt op map" onmousedown="markerCentre(XXX);" >
<img alt="v" src="icons/waypoint-down.png" title="Beweeg dit punt naar beneden" onmousedown="markerMoveDown(XXX);">
<img alt="-" src="icons/waypoint-remove.png" title="Verwijder dit punt" onmousedown="markerRemove(XXX);" >
</div>
<div id="searchresultsXXX" style="display: none;">
</div>
</div>
</div>
<div id="waypoints-buttons">
<table>
<tr><td>Close loop: <td><input type="checkbox" name="loop" onchange="formSetLoopReverse('loop' );">
<tr><td>Keer volgorde punten om:<td><input type="checkbox" name="reverse" onchange="formSetLoopReverse('reverse');">
</table>
<div class="waypoint-buttons" style="display: inline-block;">
<img src="icons/waypoint-loop.png" title="Add a new waypoint to make a loop" onmousedown="markersLoop();">
<img src="icons/waypoint-reverse.png" title="Keer volgorde punten om" onmousedown="markersReverse();">
</div>
</div>
</div>
</div>

<div class="hideshow_box">
<span id="hideshow_transport_show" onclick="hideshow_show('transport');" class="hideshow_hide">+</span>
<span id="hideshow_transport_hide" onclick="hideshow_hide('transport');" class="hideshow_show">-</span>
<span class="hideshow_title">Transport Type</span>
<div id="hideshow_transport_div">
<table>
<tr><td>Te voet: <td><input name="transport" type="radio" value="foot" onchange="formSetTransport('foot' );">
<tr><td>Paard: <td><input name="transport" type="radio" value="horse" onchange="formSetTransport('horse' );">
<tr><td>Rolstoel:<td><input name="transport" type="radio" value="wheelchair" onchange="formSetTransport('wheelchair');">
<tr><td>Fiets: <td><input name="transport" type="radio" value="bicycle" onchange="formSetTransport('bicycle' );">
<tr><td>Brommer: <td><input name="transport" type="radio" value="moped" onchange="formSetTransport('moped' );">
<tr><td>Motorfiets:<td><input name="transport" type="radio" value="motorcycle" onchange="formSetTransport('motorcycle');">
<tr><td>Auto: <td><input name="transport" type="radio" value="motorcar" onchange="formSetTransport('motorcar' );">
<tr><td>Goederen: <td><input name="transport" type="radio" value="goods" onchange="formSetTransport('goods' );">
<tr><td>Zwaar transport: <td><input name="transport" type="radio" value="hgv" onchange="formSetTransport('hgv' );">
<tr><td>Publiek transport: <td><input name="transport" type="radio" value="psv" onchange="formSetTransport('psv' );">
</table>
</div>
</div>

<div class="hideshow_box">
<span id="hideshow_highway_show" onclick="hideshow_show('highway');" class="hideshow_show">+</span>
<span id="hideshow_highway_hide" onclick="hideshow_hide('highway');" class="hideshow_hide">-</span>
<span class="hideshow_title">Voorkeur Wegtype</span>
<div id="hideshow_highway_div" style="display: none;">
<table>
<tr><td>Autostrade: <td><input name="highway-motorway" type="text" size="3" onchange="formSetHighway('motorway' ,'=');"><td>%<td><img alt="<" src="icons/waypoint-left.png" title="-" onmousedown="formSetHighway('motorway' ,'-');">&ndash;/+<img alt=">" src="icons/waypoint-right.png" title="+" onmousedown="formSetHighway('motorway' ,'+');">
<tr><td>Autoweg: <td><input name="highway-trunk" type="text" size="3" onchange="formSetHighway('trunk' ,'=');"><td>%<td><img alt="<" src="icons/waypoint-left.png" title="-" onmousedown="formSetHighway('trunk' ,'-');">&ndash;/+<img alt=">" src="icons/waypoint-right.png" title="+" onmousedown="formSetHighway('trunk' ,'+');">
<tr><td>Provinciale wegen: <td><input name="highway-primary" type="text" size="3" onchange="formSetHighway('primary' ,'=');"><td>%<td><img alt="<" src="icons/waypoint-left.png" title="-" onmousedown="formSetHighway('primary' ,'-');">&ndash;/+<img alt=">" src="icons/waypoint-right.png" title="+" onmousedown="formSetHighway('primary' ,'+');">
<tr><td>Nationale wegen: <td><input name="highway-secondary" type="text" size="3" onchange="formSetHighway('secondary' ,'=');"><td>%<td><img alt="<" src="icons/waypoint-left.png" title="-" onmousedown="formSetHighway('secondary' ,'-');">&ndash;/+<img alt=">" src="icons/waypoint-right.png" title="+" onmousedown="formSetHighway('secondary' ,'+');">
<tr><td>Doorgangsweg: <td><input name="highway-tertiary" type="text" size="3" onchange="formSetHighway('tertiary' ,'=');"><td>%<td><img alt="<" src="icons/waypoint-left.png" title="-" onmousedown="formSetHighway('tertiary' ,'-');">&ndash;/+<img alt=">" src="icons/waypoint-right.png" title="+" onmousedown="formSetHighway('tertiary' ,'+');">
<tr><td>Niet geclassificeerd:<td><input name="highway-unclassified" type="text" size="3" onchange="formSetHighway('unclassified','=');"><td>%<td><img alt="<" src="icons/waypoint-left.png" title="-" onmousedown="formSetHighway('unclassified','-');">&ndash;/+<img alt=">" src="icons/waypoint-right.png" title="+" onmousedown="formSetHighway('unclassified','+');">
<tr><td>Woongebied: <td><input name="highway-residential" type="text" size="3" onchange="formSetHighway('residential' ,'=');"><td>%<td><img alt="<" src="icons/waypoint-left.png" title="-" onmousedown="formSetHighway('residential' ,'-');">&ndash;/+<img alt=">" src="icons/waypoint-right.png" title="+" onmousedown="formSetHighway('residential' ,'+');">
<tr><td>Toegangsweg: <td><input name="highway-service" type="text" size="3" onchange="formSetHighway('service' ,'=');"><td>%<td><img alt="<" src="icons/waypoint-left.png" title="-" onmousedown="formSetHighway('service' ,'-');">&ndash;/+<img alt=">" src="icons/waypoint-right.png" title="+" onmousedown="formSetHighway('service' ,'+');">
<tr><td>Veldweg: <td><input name="highway-track" type="text" size="3" onchange="formSetHighway('track' ,'=');"><td>%<td><img alt="<" src="icons/waypoint-left.png" title="-" onmousedown="formSetHighway('track' ,'-');">&ndash;/+<img alt=">" src="icons/waypoint-right.png" title="+" onmousedown="formSetHighway('track' ,'+');">
<tr><td>Fietspad: <td><input name="highway-cycleway" type="text" size="3" onchange="formSetHighway('cycleway' ,'=');"><td>%<td><img alt="<" src="icons/waypoint-left.png" title="-" onmousedown="formSetHighway('cycleway' ,'-');">&ndash;/+<img alt=">" src="icons/waypoint-right.png" title="+" onmousedown="formSetHighway('cycleway' ,'+');">
<tr><td>Pad: <td><input name="highway-path" type="text" size="3" onchange="formSetHighway('path' ,'=');"><td>%<td><img alt="<" src="icons/waypoint-left.png" title="-" onmousedown="formSetHighway('path' ,'-');">&ndash;/+<img alt=">" src="icons/waypoint-right.png" title="+" onmousedown="formSetHighway('path' ,'+');">
<tr><td>Trap: <td><input name="highway-steps" type="text" size="3" onchange="formSetHighway('steps' ,'=');"><td>%<td><img alt="<" src="icons/waypoint-left.png" title="-" onmousedown="formSetHighway('steps' ,'-');">&ndash;/+<img alt=">" src="icons/waypoint-right.png" title="+" onmousedown="formSetHighway('steps' ,'+');">
<tr><td>Ferry: <td><input name="highway-ferry" type="text" size="3" onchange="formSetHighway('ferry' ,'=');"><td>%<td><img alt="<" src="icons/waypoint-left.png" title="-" onmousedown="formSetHighway('ferry' ,'-');">&ndash;/+<img alt=">" src="icons/waypoint-right.png" title="+" onmousedown="formSetHighway('ferry' ,'+');">
</table>
</div>
</div>

<div class="hideshow_box">
<span id="hideshow_speed_show" onclick="hideshow_show('speed');" class="hideshow_show">+</span>
<span id="hideshow_speed_hide" onclick="hideshow_hide('speed');" class="hideshow_hide">-</span>
<span class="hideshow_title">Snelheidslimieten</span>
<div id="hideshow_speed_div" style="display: none;">
<table>
<tr><td>Autostrade: <td><input name="speed-motorway" type="text" size="3" onchange="formSetSpeed('motorway' ,'=');"><td>km/hr<td><img alt="<" src="icons/waypoint-left.png" title="-" onmousedown="formSetSpeed('motorway' ,'-');">&ndash;/+<img alt=">" src="icons/waypoint-right.png" title="+" onmousedown="formSetSpeed('motorway' ,'+');">
<tr><td>Autoweg: <td><input name="speed-trunk" type="text" size="3" onchange="formSetSpeed('trunk' ,'=');"><td>km/hr<td><img alt="<" src="icons/waypoint-left.png" title="-" onmousedown="formSetSpeed('trunk' ,'-');">&ndash;/+<img alt=">" src="icons/waypoint-right.png" title="+" onmousedown="formSetSpeed('trunk' ,'+');">
<tr><td>Provinciale wegen: <td><input name="speed-primary" type="text" size="3" onchange="formSetSpeed('primary' ,'=');"><td>km/hr<td><img alt="<" src="icons/waypoint-left.png" title="-" onmousedown="formSetSpeed('primary' ,'-');">&ndash;/+<img alt=">" src="icons/waypoint-right.png" title="+" onmousedown="formSetSpeed('primary' ,'+');">
<tr><td>Nationale wegen: <td><input name="speed-secondary" type="text" size="3" onchange="formSetSpeed('secondary' ,'=');"><td>km/hr<td><img alt="<" src="icons/waypoint-left.png" title="-" onmousedown="formSetSpeed('secondary' ,'-');">&ndash;/+<img alt=">" src="icons/waypoint-right.png" title="+" onmousedown="formSetSpeed('secondary' ,'+');">
<tr><td>Doorgangsweg: <td><input name="speed-tertiary" type="text" size="3" onchange="formSetSpeed('tertiary' ,'=');"><td>km/hr<td><img alt="<" src="icons/waypoint-left.png" title="-" onmousedown="formSetSpeed('tertiary' ,'-');">&ndash;/+<img alt=">" src="icons/waypoint-right.png" title="+" onmousedown="formSetSpeed('tertiary' ,'+');">
<tr><td>Niet geclassificeerd:<td><input name="speed-unclassified" type="text" size="3" onchange="formSetSpeed('unclassified','=');"><td>km/hr<td><img alt="<" src="icons/waypoint-left.png" title="-" onmousedown="formSetSpeed('unclassified','-');">&ndash;/+<img alt=">" src="icons/waypoint-right.png" title="+" onmousedown="formSetSpeed('unclassified','+');">
<tr><td>Woongebied: <td><input name="speed-residential" type="text" size="3" onchange="formSetSpeed('residential' ,'=');"><td>km/hr<td><img alt="<" src="icons/waypoint-left.png" title="-" onmousedown="formSetSpeed('residential' ,'-');">&ndash;/+<img alt=">" src="icons/waypoint-right.png" title="+" onmousedown="formSetSpeed('residential' ,'+');">
<tr><td>Toegangsweg: <td><input name="speed-service" type="text" size="3" onchange="formSetSpeed('service' ,'=');"><td>km/hr<td><img alt="<" src="icons/waypoint-left.png" title="-" onmousedown="formSetSpeed('service' ,'-');">&ndash;/+<img alt=">" src="icons/waypoint-right.png" title="+" onmousedown="formSetSpeed('service' ,'+');">
<tr><td>Veldweg: <td><input name="speed-track" type="text" size="3" onchange="formSetSpeed('track' ,'=');"><td>km/hr<td><img alt="<" src="icons/waypoint-left.png" title="-" onmousedown="formSetSpeed('track' ,'-');">&ndash;/+<img alt=">" src="icons/waypoint-right.png" title="+" onmousedown="formSetSpeed('track' ,'+');">
<tr><td>Fietspad: <td><input name="speed-cycleway" type="text" size="3" onchange="formSetSpeed('cycleway' ,'=');"><td>km/hr<td><img alt="<" src="icons/waypoint-left.png" title="-" onmousedown="formSetSpeed('cycleway' ,'-');">&ndash;/+<img alt=">" src="icons/waypoint-right.png" title="+" onmousedown="formSetSpeed('cycleway' ,'+');">
<tr><td>Pad: <td><input name="speed-path" type="text" size="3" onchange="formSetSpeed('path' ,'=');"><td>km/hr<td><img alt="<" src="icons/waypoint-left.png" title="-" onmousedown="formSetSpeed('path' ,'-');">&ndash;/+<img alt=">" src="icons/waypoint-right.png" title="+" onmousedown="formSetSpeed('path' ,'+');">
<tr><td>Trap: <td><input name="speed-steps" type="text" size="3" onchange="formSetSpeed('steps' ,'=');"><td>km/hr<td><img alt="<" src="icons/waypoint-left.png" title="-" onmousedown="formSetSpeed('steps' ,'-');">&ndash;/+<img alt=">" src="icons/waypoint-right.png" title="+" onmousedown="formSetSpeed('steps' ,'+');">
<tr><td>Ferry: <td><input name="speed-ferry" type="text" size="3" onchange="formSetSpeed('ferry' ,'=');"><td>km/hr<td><img alt="<" src="icons/waypoint-left.png" title="-" onmousedown="formSetSpeed('ferry' ,'-');">&ndash;/+<img alt=">" src="icons/waypoint-right.png" title="+" onmousedown="formSetSpeed('ferry' ,'+');">
</table>
</div>
</div>

<div class="hideshow_box">
<span id="hideshow_property_show" onclick="hideshow_show('property');" class="hideshow_show">+</span>
<span id="hideshow_property_hide" onclick="hideshow_hide('property');" class="hideshow_hide">-</span>
<span class="hideshow_title">Weg Eigenschappen</span>
<div id="hideshow_property_div" style="display: none;">
<table>
<tr><td>Verhard: <td><input name="property-paved" type="text" size="3" onchange="formSetProperty('paved' ,'=');"><td>%<td><img alt="<" src="icons/waypoint-left.png" title="-" onmousedown="formSetProperty('paved' ,'-');">&ndash;/+<img alt=">" src="icons/waypoint-right.png" title="+" onmousedown="formSetProperty('paved' ,'+');">
<tr><td>Meerdere Stroken: <td><input name="property-multilane" type="text" size="3" onchange="formSetProperty('multilane' ,'=');"><td>%<td><img alt="<" src="icons/waypoint-left.png" title="-" onmousedown="formSetProperty('multilane' ,'-');">&ndash;/+<img alt=">" src="icons/waypoint-right.png" title="+" onmousedown="formSetProperty('multilane' ,'+');">
<tr><td>Brug: <td><input name="property-bridge" type="text" size="3" onchange="formSetProperty('bridge' ,'=');"><td>%<td><img alt="<" src="icons/waypoint-left.png" title="-" onmousedown="formSetProperty('bridge' ,'-');">&ndash;/+<img alt=">" src="icons/waypoint-right.png" title="+" onmousedown="formSetProperty('bridge' ,'+');">
<tr><td>Tunnel: <td><input name="property-tunnel" type="text" size="3" onchange="formSetProperty('tunnel' ,'=');"><td>%<td><img alt="<" src="icons/waypoint-left.png" title="-" onmousedown="formSetProperty('tunnel' ,'-');">&ndash;/+<img alt=">" src="icons/waypoint-right.png" title="+" onmousedown="formSetProperty('tunnel' ,'+');">
<tr><td>Walking Route:<td><input name="property-footroute" type="text" size="3" onchange="formSetProperty('footroute' ,'=');"><td>%<td><img alt="<" src="icons/waypoint-left.png" title="-" onmousedown="formSetProperty('footroute' ,'-');">&ndash;/+<img alt=">" src="icons/waypoint-right.png" title="+" onmousedown="formSetProperty('footroute' ,'+');">
<tr><td>Bicycle Route:<td><input name="property-bicycleroute" type="text" size="3" onchange="formSetProperty('bicycleroute','=');"><td>%<td><img alt="<" src="icons/waypoint-left.png" title="-" onmousedown="formSetProperty('bicycleroute','-');">&ndash;/+<img alt=">" src="icons/waypoint-right.png" title="+" onmousedown="formSetProperty('bicycleroute','+');">
</table>
</div>
</div>

<div class="hideshow_box">
<span id="hideshow_restriction_show" onclick="hideshow_show('restriction');" class="hideshow_show">+</span>
<span id="hideshow_restriction_hide" onclick="hideshow_hide('restriction');" class="hideshow_hide">-</span>
<span class="hideshow_title">Andere Beperkingen</span>
<div id="hideshow_restriction_div" style="display: none;">
<table>
<tr><td>Volg Eenrichtingsverkeer:<td><input name="restrict-oneway" type="checkbox" onchange="formSetRestriction('oneway');">
<tr><td>Obey turn restrictions: <td><input name="restrict-turns" type="checkbox" onchange="formSetRestriction('turns' );">
</table>
<table>
<tr><td>Gewicht:<td><input name="restrict-weight" type="text" size="3" onchange="formSetRestriction('weight','=');"><td>tonnes<td><img alt="<" src="icons/waypoint-left.png" title="-" onmousedown="formSetRestriction('weight','-');">&ndash;/+<img alt=">" src="icons/waypoint-right.png" title="+" onmousedown="formSetRestriction('weight','+');">
<tr><td>Hoogte:<td><input name="restrict-height" type="text" size="3" onchange="formSetRestriction('height','=');"><td>metres<td><img alt="<" src="icons/waypoint-left.png" title="-" onmousedown="formSetRestriction('height','-');">&ndash;/+<img alt=">" src="icons/waypoint-right.png" title="+" onmousedown="formSetRestriction('height','+');">
<tr><td>Breedte: <td><input name="restrict-width" type="text" size="3" onchange="formSetRestriction('width' ,'=');"><td>metres<td><img alt="<" src="icons/waypoint-left.png" title="-" onmousedown="formSetRestriction('width' ,'-');">&ndash;/+<img alt=">" src="icons/waypoint-right.png" title="+" onmousedown="formSetRestriction('width' ,'+');">
<tr><td>Lengte:<td><input name="restrict-length" type="text" size="3" onchange="formSetRestriction('length','=');"><td>metres<td><img alt="<" src="icons/waypoint-left.png" title="-" onmousedown="formSetRestriction('length','-');">&ndash;/+<img alt=">" src="icons/waypoint-right.png" title="+" onmousedown="formSetRestriction('length','+');">
</table>
</div>
</div>

<div class="hideshow_box">
<span class="hideshow_title">Zoek Route</span>
<input type="button" title="Zoek de kortste route" id="shortest" value="Kortste Route" onclick="findRoute('shortest');" disabled="disabled">
<input type="button" title="Zoek de snelste route" id="quickest" value="Snelste Route" onclick="findRoute('quickest');" disabled="disabled">
</div>

<div class="hideshow_box">
<span class="hideshow_title">Links</span>
<a id="permalink_url" href="router.html">Link to this map view</a>
<br>
<a id="edit_url" target="edit" style="display: none;">Lees hoe je OSM data kan inbrengen</a>
</div>

<div class="hideshow_box">
<span id="hideshow_help_options_show" onclick="hideshow_show('help_options');" class="hideshow_hide">+</span>
<span id="hideshow_help_options_hide" onclick="hideshow_hide('help_options');" class="hideshow_show">-</span>
<span class="hideshow_title">Help</span>
<div id="hideshow_help_options_div">
<div class="scrollable">
<b>Quick Start</b>
<br>
Click op marker-icoontje (Waypoints) om ze op de map te plaatsen (rechts).
Sleep ze vervolgens naar de gewenste positie.
Het is best om eerst naar straat niveau te zoomen op de kaart.
Selecteer het transport type, toegestane weg-types,
snelheidslimieten, wegeigenschappen en andere restricties uit de
opties.
Selecteer "Kortste" of "Snelste" om de route te berekenen en te tekenen op de map.
<p>
<b>Coordinaten (Waypoints)</b>
<br>
Click op het marker icoontje, nog eens clicken voor aan/uit.
Wanneer de route berekend wordt, zal dit nauwkeurig aansluiten bij de volgorde van deze punten. (rekening houdend met transport type)
<p>
<b>Transport Type</b>
<br>
Wanneer je een bepaald transport type kiest wordt bij berekenen
route hiermede rekening gehouden.
Het transport type bestaat uit een lijst met default waarden voor
ieder wegtype.
Deze percentages kunnen ook nog eens manueel aangepast worden.
<p>
<b>Voorkeur Wegtype</b>
<br>
De voorkeur voor een bepaald type weg wordt uitgedrukt in een percentage.
Bijvoorbeeld wanneer u het Transport Type "Fiets" kiest, dan zal er
voor Autostrade 0% staan, en voor Fietspad 100%.
Wanneer u Autowegen, Nationale wegen wil vermijden of beperken bij
het maken van een fietsroute, kan u percentage naar beneden
aanpassen.
<p>
<b>Snelheid limieten</b>
<br>
De snelheidslimieten worden afgeleid van het type weg. Het is
mogelijk dat er voor een bepaalde weg andere beperkingen gelden. In
dat geval worden die gekoezen. (het geval dat deze lager zijn dan de
default)
<p>
<b>Weg Eigenschappen</b>
<br>
Voor het berekenen van de route, kan de de voorkeur gegeven worden
aan een bepaalde wegeigenschap.
Wanneer u kiest voor 25% verhard, zal er automatisch de voorkeur aan
75% onverhard worden gegeven.
Ook al is het onverharde stuk 3 X langer, toch kan er dan de
voorkeur aan gegeven worden.
<p>
<b>Andere Beperkingen</b>
<br>
Deze zullen toelaten dat er een route berekend wordt die rekening
houdt met gewicht, hoogte, breedte of lengte.
Het is ook mogelijk geen rekening te houden met eenrichtingsverkeer
(bijvoorbeeld als voetganger of fietser)
</div>
</div>
</div>
</form>
</div>


<div class="tab_content" id="tab_results_div" style="display: none;">

<div class="hideshow_box">
<span class="hideshow_title">Status</span>
<div id="result_status">
<div id="result_status_not_run">
<b><i>Router niet in gebruik</i></b>
</div>
<div id="result_status_running" style="display: none;">
<b>Router werkt...</b>
</div>
<div id="result_status_complete" style="display: none;">
<b>Routing voltooid</b>
<br>
<a id="router_log_complete" target="router_log" href="#">View Details</a>
</div>
<div id="result_status_error" style="display: none;">
<b>Router error</b>
<br>
<a id="router_log_error" target="router_log" href="#">View Details</a>
</div>
<div id="result_status_failed" style="display: none;">
<b>Router werkt niet</b>
</div>
</div>
</div>

<div class="hideshow_box">
<span id="hideshow_shortest_show" onclick="hideshow_show('shortest');" class="hideshow_show">+</span>
<span id="hideshow_shortest_hide" onclick="hideshow_hide('shortest');" class="hideshow_hide">-</span>
<span class="hideshow_title">Kortste Route</span>
<div id="shortest_status">
<div id="shortest_status_no_info">
<b><i>No Information</i></b>
</div>
<div id="shortest_status_info" style="display: none;">
</div>
</div>
<div id="hideshow_shortest_div" style="display: none;">
<div id="shortest_links" style="display: none;">
<table>
<tr><td>HTML directions: <td><a id="shortest_html" target="shortest_html" href="#">Open Popup</a>
<tr><td>GPX track bestand: <td><a id="shortest_gpx_track" target="shortest_gpx_track" href="#">Open Popup</a>
<tr><td>GPX route bestand: <td><a id="shortest_gpx_route" target="shortest_gpx_route" href="#">Open Popup</a>
<tr><td>Volledig tekst bestand: <td><a id="shortest_text_all" target="shortest_text_all" href="#">Open Popup</a>
<tr><td>Tekst bestand: <td><a id="shortest_text" target="shortest_text" href="#">Open Popup</a>
</table>
<hr>
</div>
<div id="shortest_route">
</div>
</div>
</div>

<div class="hideshow_box">
<span id="hideshow_quickest_show" onclick="hideshow_show('quickest');" class="hideshow_show">+</span>
<span id="hideshow_quickest_hide" onclick="hideshow_hide('quickest');" class="hideshow_hide">-</span>
<span class="hideshow_title">Snelste Route</span>
<div id="quickest_status">
<div id="quickest_status_no_info">
<b><i>No Information</i></b>
</div>
<div id="quickest_status_info" style="display: none;">
</div>
</div>
<div id="hideshow_quickest_div" style="display: none;">
<div id="quickest_links" style="display: none;">
<table>
<tr><td>HTML directions: <td><a id="quickest_html" target="quickest_html" href="#">Open Popup</a>
<tr><td>GPX track bestand: <td><a id="quickest_gpx_track" target="quickest_gpx_track" href="#">Open Popup</a>
<tr><td>GPX route bestand: <td><a id="quickest_gpx_route" target="quickest_gpx_route" href="#">Open Popup</a>
<tr><td>Volledig tekst bestand: <td><a id="quickest_text_all" target="quickest_text_all" href="#">Open Popup</a>
<tr><td>Tekst bestand: <td><a id="quickest_text" target="quickest_text" href="#">Open Popup</a>
</table>
<hr>
</div>
<div id="quickest_route">
</div>
</div>
</div>

<div class="hideshow_box">
<span id="hideshow_help_route_show" onclick="hideshow_show('help_route');" class="hideshow_hide">+</span>
<span id="hideshow_help_route_hide" onclick="hideshow_hide('help_route');" class="hideshow_show">-</span>
<span class="hideshow_title">Help</span>
<div id="hideshow_help_route_div">
<div class="scrollable">
<b>Quick Start</b>
<br>
Na het berekenen van een route, kan het GPX bestand, of de beschrijving als tekstbestand downloaden.
Door met muis over de beschrijving te bewegen, ziet u die ook op de kaart gesitueerd.
<p>
<b>Problem Solving</b>
<br>
Als de router eindigt met een fout, dan is de meest waarschijnlijke
oorzaak, dat er geen route mogelijk is tussen de gekozen punten.
Het verplaatsen van de punten, of het aanpassen van weg-eigenschappen
of voertuigtype kan een oplossing bieden.
<p>
<b>Output Formats</b>
<br>
<dl>
<dt>HTML instructies
<dd>Een beschrijving van de route, met de te nemen afslag aan iedere splitsing.
<dt>GPX track bestand
<dd>Dezelfde informatie die op de kaart wordt weergegeven. Met
coordinaten voor ieder knooppunt, en een track voor ieder segment.
<dt>GPX route bestand
<dd>Dezelfde informatie dat is opgenomen in de tekst van de route,
met een coordinaat voor iedere belangrijke splitsing.
<dt>Full text bestand
<dd>Een lijst met alle coordinaten, met de afstand hier tussen. En
een cumulatieve afstand voor iedere stap op de route.
<dt>Text bestand
<dd>Dezelfde informatie als wordt weergegeven in de tekst voor de route.
</dl>
</div>
</div>
</div>
</div>


<div class="tab_content" id="tab_data_div" style="display: none;">
<div class="hideshow_box">
<span class="hideshow_title">Routino Statistics</span>
<div id="statistics_data"></div>
<a id="statistics_link" href="statistics.cgi" onclick="displayStatistics();return(false);">Display data statistics</a>
</div>

<div class="hideshow_box">
<span class="hideshow_title">Routino Visualiser</span>
Om te kijken hoe Routino omgaat met de basisdata,
is er een tooltje dat de onderliggende data toont op verschillende manieren.
<br>
<a id="visualiser_url" href="visualiser.html" target="visualiser">Link to this map view</a>
</div>
</div>

</div>

<!-- Right hand side of window - map -->

<div class="right_panel">
<div class="map" id="map">
<noscript>
<p>
Javascript is <em>required</em> to use this web page because of the interactive map.
</noscript>
</div>
<div class="attribution">
Router: <a href="http://www.routino.org/" target="routino">Routino</a>
|
Geo Data: <span id="attribution_data"></span>
|
Tiles: <span id="attribution_tile"></span>
</div>
</div>

</body>

</html>
