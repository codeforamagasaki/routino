<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>

<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta name="keywords" content="openstreetmap routing route planner 車椅子 経路探索 ルート検索 C4AMA CodeforAmagasaki コードフォーアマガサキ OSM オープンデータ">
<meta name="viewport" content="width=device-width, height=device-height, initial-scale=1, user-scalable=no">

<title>Routino : Planowanie trasy dla Danych OpenStreetMap</title>

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
<span id="tab_options" onclick="tab_select('options');" class="tab_selected" title="Ustaw punkty trasy">Opcje</span>
<span id="tab_results" onclick="tab_select('results');" class="tab_unselected" title="Zobacz wyniki">Wyniki</span>
<span id="tab_data" onclick="tab_select('data');" class="tab_unselected" title="Zobacz informacje bazy danych">Dane</span>
</div>

<div class="tab_content" id="tab_options_div">

<form name="form" id="form" action="#" method="get" onsubmit="return false;">
<div class="hideshow_box">
<span class="hideshow_title">Routino OpenStreetMap Planowanie Trasy</span>
This web page allows routing within the data collected by OpenStreetMap.
Select start and end points (click on the marker icons below), select routing preferences then find a route.
<div class="center">
<a target="other" href="http://www.routino.org/">Strona Routino</a>
|
<a target="other" href="documentation/">Dokumentacja</a>
</div>
</div>

<div class="hideshow_box">
<span id="hideshow_language_show" onclick="hideshow_show('language');" class="hideshow_show">+</span>
<span id="hideshow_language_hide" onclick="hideshow_hide('language');" class="hideshow_hide">-</span>
<span class="hideshow_title">Język</span>

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
<td><input name="language" type="radio" value="nl" onchange="formSetLanguage();" >
<tr>
<td><a id="lang_pl_url" href="router.html.pl" title="Polski webpage">Polski</a>
<td>(PL)
<td><input name="language" type="radio" value="pl" onchange="formSetLanguage();" checked>
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
<span class="hideshow_title">Punkty</span>
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
<img alt="?" src="icons/waypoint-search.png" title="Znajdź miejsce" onmousedown="markerSearch(XXX);" >
<img alt="G" src="icons/waypoint-locate.png" title="Pobierz aktualna lokalizację" onmousedown="markerLocate(XXX);" >
<img alt="O" src="icons/waypoint-recentre.png" title="Wycentruj mapę na tym punkcie" onmousedown="markerRecentre(XXX);">
<img alt="^" src="icons/waypoint-up.png" title="Move this waypoint up" onmousedown="markerMoveUp(XXX);" >
<img alt="+" src="icons/waypoint-add.png" title="Add waypoint after this one" onmousedown="markerAddAfter(XXX);">
<br>
<img alt="#" src="icons/waypoint-coords.png" title="Coordinates for location" onmousedown="markerCoords(XXX);" >
<img alt="~" src="icons/waypoint-home.png" title="Współrzędne lokalizacji" onmousedown="markerHome(XXX);" >
<img alt="o" src="icons/waypoint-centre.png" title="Centre this waypoint on map" onmousedown="markerCentre(XXX);" >
<img alt="v" src="icons/waypoint-down.png" title="Move this waypoint down" onmousedown="markerMoveDown(XXX);">
<img alt="-" src="icons/waypoint-remove.png" title="Remove this waypoint" onmousedown="markerRemove(XXX);" >
</div>
<div id="searchresultsXXX" style="display: none;">
</div>
</div>
</div>
<div id="waypoints-buttons">
<table>
<tr><td>Close loop: <td><input type="checkbox" name="loop" onchange="formSetLoopReverse('loop' );">
<tr><td>Reverse order:<td><input type="checkbox" name="reverse" onchange="formSetLoopReverse('reverse');">
</table>
<div class="waypoint-buttons" style="display: inline-block;">
<img src="icons/waypoint-loop.png" title="Add a new waypoint to make a loop" onmousedown="markersLoop();">
<img src="icons/waypoint-reverse.png" title="Reverse order of waypoints" onmousedown="markersReverse();">
</div>
</div>
</div>
</div>

<div class="hideshow_box">
<span id="hideshow_transport_show" onclick="hideshow_show('transport');" class="hideshow_hide">+</span>
<span id="hideshow_transport_hide" onclick="hideshow_hide('transport');" class="hideshow_show">-</span>
<span class="hideshow_title">Typ transportu</span>
<div id="hideshow_transport_div">
<table>
<tr><td>Pieszo: <td><input name="transport" type="radio" value="foot" onchange="formSetTransport('foot' );">
<tr><td>Konno: <td><input name="transport" type="radio" value="horse" onchange="formSetTransport('horse' );">
<tr><td>Wózek inwalidzki:<td><input name="transport" type="radio" value="wheelchair" onchange="formSetTransport('wheelchair');">
<tr><td>Rower: <td><input name="transport" type="radio" value="bicycle" onchange="formSetTransport('bicycle' );">
<tr><td>Moped: <td><input name="transport" type="radio" value="moped" onchange="formSetTransport('moped' );">
<tr><td>Motocykl:<td><input name="transport" type="radio" value="motorcycle" onchange="formSetTransport('motorcycle');">
<tr><td>Samochód: <td><input name="transport" type="radio" value="motorcar" onchange="formSetTransport('motorcar' );">
<tr><td>Goods: <td><input name="transport" type="radio" value="goods" onchange="formSetTransport('goods' );">
<tr><td>HGV: <td><input name="transport" type="radio" value="hgv" onchange="formSetTransport('hgv' );">
<tr><td>Pojazd użyteczności publicznej: <td><input name="transport" type="radio" value="psv" onchange="formSetTransport('psv' );">
</table>
</div>
</div>

<div class="hideshow_box">
<span id="hideshow_highway_show" onclick="hideshow_show('highway');" class="hideshow_show">+</span>
<span id="hideshow_highway_hide" onclick="hideshow_hide('highway');" class="hideshow_hide">-</span>
<span class="hideshow_title">Preferowanie autostrad</span>
<div id="hideshow_highway_div" style="display: none;">
<table>
<tr><td>Autostrada: <td><input name="highway-motorway" type="text" size="3" onchange="formSetHighway('motorway' ,'=');"><td>%<td><img alt="<" src="icons/waypoint-left.png" title="-" onmousedown="formSetHighway('motorway' ,'-');">&ndash;/+<img alt=">" src="icons/waypoint-right.png" title="+" onmousedown="formSetHighway('motorway' ,'+');">
<tr><td>Trunk: <td><input name="highway-trunk" type="text" size="3" onchange="formSetHighway('trunk' ,'=');"><td>%<td><img alt="<" src="icons/waypoint-left.png" title="-" onmousedown="formSetHighway('trunk' ,'-');">&ndash;/+<img alt=">" src="icons/waypoint-right.png" title="+" onmousedown="formSetHighway('trunk' ,'+');">
<tr><td>Droga krajowa: <td><input name="highway-primary" type="text" size="3" onchange="formSetHighway('primary' ,'=');"><td>%<td><img alt="<" src="icons/waypoint-left.png" title="-" onmousedown="formSetHighway('primary' ,'-');">&ndash;/+<img alt=">" src="icons/waypoint-right.png" title="+" onmousedown="formSetHighway('primary' ,'+');">
<tr><td>Droga wojewódzka: <td><input name="highway-secondary" type="text" size="3" onchange="formSetHighway('secondary' ,'=');"><td>%<td><img alt="<" src="icons/waypoint-left.png" title="-" onmousedown="formSetHighway('secondary' ,'-');">&ndash;/+<img alt=">" src="icons/waypoint-right.png" title="+" onmousedown="formSetHighway('secondary' ,'+');">
<tr><td>Droga powiatowa: <td><input name="highway-tertiary" type="text" size="3" onchange="formSetHighway('tertiary' ,'=');"><td>%<td><img alt="<" src="icons/waypoint-left.png" title="-" onmousedown="formSetHighway('tertiary' ,'-');">&ndash;/+<img alt=">" src="icons/waypoint-right.png" title="+" onmousedown="formSetHighway('tertiary' ,'+');">
<tr><td>Niesklasyfikowana:<td><input name="highway-unclassified" type="text" size="3" onchange="formSetHighway('unclassified','=');"><td>%<td><img alt="<" src="icons/waypoint-left.png" title="-" onmousedown="formSetHighway('unclassified','-');">&ndash;/+<img alt=">" src="icons/waypoint-right.png" title="+" onmousedown="formSetHighway('unclassified','+');">
<tr><td>W obszarze zamieszkania: <td><input name="highway-residential" type="text" size="3" onchange="formSetHighway('residential' ,'=');"><td>%<td><img alt="<" src="icons/waypoint-left.png" title="-" onmousedown="formSetHighway('residential' ,'-');">&ndash;/+<img alt=">" src="icons/waypoint-right.png" title="+" onmousedown="formSetHighway('residential' ,'+');">
<tr><td>Dojazdowa: <td><input name="highway-service" type="text" size="3" onchange="formSetHighway('service' ,'=');"><td>%<td><img alt="<" src="icons/waypoint-left.png" title="-" onmousedown="formSetHighway('service' ,'-');">&ndash;/+<img alt=">" src="icons/waypoint-right.png" title="+" onmousedown="formSetHighway('service' ,'+');">
<tr><td>Track: <td><input name="highway-track" type="text" size="3" onchange="formSetHighway('track' ,'=');"><td>%<td><img alt="<" src="icons/waypoint-left.png" title="-" onmousedown="formSetHighway('track' ,'-');">&ndash;/+<img alt=">" src="icons/waypoint-right.png" title="+" onmousedown="formSetHighway('track' ,'+');">
<tr><td>Rowerowa: <td><input name="highway-cycleway" type="text" size="3" onchange="formSetHighway('cycleway' ,'=');"><td>%<td><img alt="<" src="icons/waypoint-left.png" title="-" onmousedown="formSetHighway('cycleway' ,'-');">&ndash;/+<img alt=">" src="icons/waypoint-right.png" title="+" onmousedown="formSetHighway('cycleway' ,'+');">
<tr><td>Ścieżka: <td><input name="highway-path" type="text" size="3" onchange="formSetHighway('path' ,'=');"><td>%<td><img alt="<" src="icons/waypoint-left.png" title="-" onmousedown="formSetHighway('path' ,'-');">&ndash;/+<img alt=">" src="icons/waypoint-right.png" title="+" onmousedown="formSetHighway('path' ,'+');">
<tr><td>Steps: <td><input name="highway-steps" type="text" size="3" onchange="formSetHighway('steps' ,'=');"><td>%<td><img alt="<" src="icons/waypoint-left.png" title="-" onmousedown="formSetHighway('steps' ,'-');">&ndash;/+<img alt=">" src="icons/waypoint-right.png" title="+" onmousedown="formSetHighway('steps' ,'+');">
<tr><td>Przeprawa: <td><input name="highway-ferry" type="text" size="3" onchange="formSetHighway('ferry' ,'=');"><td>%<td><img alt="<" src="icons/waypoint-left.png" title="-" onmousedown="formSetHighway('ferry' ,'-');">&ndash;/+<img alt=">" src="icons/waypoint-right.png" title="+" onmousedown="formSetHighway('ferry' ,'+');">
</table>
</div>
</div>

<div class="hideshow_box">
<span id="hideshow_speed_show" onclick="hideshow_show('speed');" class="hideshow_show">+</span>
<span id="hideshow_speed_hide" onclick="hideshow_hide('speed');" class="hideshow_hide">-</span>
<span class="hideshow_title">Ograniczenia prędkości</span>
<div id="hideshow_speed_div" style="display: none;">
<table>
<tr><td>Autostrada: <td><input name="speed-motorway" type="text" size="3" onchange="formSetSpeed('motorway' ,'=');"><td>km/hr<td><img alt="<" src="icons/waypoint-left.png" title="-" onmousedown="formSetSpeed('motorway' ,'-');">&ndash;/+<img alt=">" src="icons/waypoint-right.png" title="+" onmousedown="formSetSpeed('motorway' ,'+');">
<tr><td>Trunk: <td><input name="speed-trunk" type="text" size="3" onchange="formSetSpeed('trunk' ,'=');"><td>km/hr<td><img alt="<" src="icons/waypoint-left.png" title="-" onmousedown="formSetSpeed('trunk' ,'-');">&ndash;/+<img alt=">" src="icons/waypoint-right.png" title="+" onmousedown="formSetSpeed('trunk' ,'+');">
<tr><td>Droga krajowa: <td><input name="speed-primary" type="text" size="3" onchange="formSetSpeed('primary' ,'=');"><td>km/hr<td><img alt="<" src="icons/waypoint-left.png" title="-" onmousedown="formSetSpeed('primary' ,'-');">&ndash;/+<img alt=">" src="icons/waypoint-right.png" title="+" onmousedown="formSetSpeed('primary' ,'+');">
<tr><td>Droga wojewódzka: <td><input name="speed-secondary" type="text" size="3" onchange="formSetSpeed('secondary' ,'=');"><td>km/hr<td><img alt="<" src="icons/waypoint-left.png" title="-" onmousedown="formSetSpeed('secondary' ,'-');">&ndash;/+<img alt=">" src="icons/waypoint-right.png" title="+" onmousedown="formSetSpeed('secondary' ,'+');">
<tr><td>Droga powiatowa: <td><input name="speed-tertiary" type="text" size="3" onchange="formSetSpeed('tertiary' ,'=');"><td>km/hr<td><img alt="<" src="icons/waypoint-left.png" title="-" onmousedown="formSetSpeed('tertiary' ,'-');">&ndash;/+<img alt=">" src="icons/waypoint-right.png" title="+" onmousedown="formSetSpeed('tertiary' ,'+');">
<tr><td>Niesklasyfikowana:<td><input name="speed-unclassified" type="text" size="3" onchange="formSetSpeed('unclassified','=');"><td>km/hr<td><img alt="<" src="icons/waypoint-left.png" title="-" onmousedown="formSetSpeed('unclassified','-');">&ndash;/+<img alt=">" src="icons/waypoint-right.png" title="+" onmousedown="formSetSpeed('unclassified','+');">
<tr><td>W obszarze zamieszkania: <td><input name="speed-residential" type="text" size="3" onchange="formSetSpeed('residential' ,'=');"><td>km/hr<td><img alt="<" src="icons/waypoint-left.png" title="-" onmousedown="formSetSpeed('residential' ,'-');">&ndash;/+<img alt=">" src="icons/waypoint-right.png" title="+" onmousedown="formSetSpeed('residential' ,'+');">
<tr><td>Dojazdowa: <td><input name="speed-service" type="text" size="3" onchange="formSetSpeed('service' ,'=');"><td>km/hr<td><img alt="<" src="icons/waypoint-left.png" title="-" onmousedown="formSetSpeed('service' ,'-');">&ndash;/+<img alt=">" src="icons/waypoint-right.png" title="+" onmousedown="formSetSpeed('service' ,'+');">
<tr><td>Track: <td><input name="speed-track" type="text" size="3" onchange="formSetSpeed('track' ,'=');"><td>km/hr<td><img alt="<" src="icons/waypoint-left.png" title="-" onmousedown="formSetSpeed('track' ,'-');">&ndash;/+<img alt=">" src="icons/waypoint-right.png" title="+" onmousedown="formSetSpeed('track' ,'+');">
<tr><td>Rowerowa: <td><input name="speed-cycleway" type="text" size="3" onchange="formSetSpeed('cycleway' ,'=');"><td>km/hr<td><img alt="<" src="icons/waypoint-left.png" title="-" onmousedown="formSetSpeed('cycleway' ,'-');">&ndash;/+<img alt=">" src="icons/waypoint-right.png" title="+" onmousedown="formSetSpeed('cycleway' ,'+');">
<tr><td>Ścieżka: <td><input name="speed-path" type="text" size="3" onchange="formSetSpeed('path' ,'=');"><td>km/hr<td><img alt="<" src="icons/waypoint-left.png" title="-" onmousedown="formSetSpeed('path' ,'-');">&ndash;/+<img alt=">" src="icons/waypoint-right.png" title="+" onmousedown="formSetSpeed('path' ,'+');">
<tr><td>Steps: <td><input name="speed-steps" type="text" size="3" onchange="formSetSpeed('steps' ,'=');"><td>km/hr<td><img alt="<" src="icons/waypoint-left.png" title="-" onmousedown="formSetSpeed('steps' ,'-');">&ndash;/+<img alt=">" src="icons/waypoint-right.png" title="+" onmousedown="formSetSpeed('steps' ,'+');">
<tr><td>Przeprawa: <td><input name="speed-ferry" type="text" size="3" onchange="formSetSpeed('ferry' ,'=');"><td>km/hr<td><img alt="<" src="icons/waypoint-left.png" title="-" onmousedown="formSetSpeed('ferry' ,'-');">&ndash;/+<img alt=">" src="icons/waypoint-right.png" title="+" onmousedown="formSetSpeed('ferry' ,'+');">
</table>
</div>
</div>

<div class="hideshow_box">
<span id="hideshow_property_show" onclick="hideshow_show('property');" class="hideshow_show">+</span>
<span id="hideshow_property_hide" onclick="hideshow_hide('property');" class="hideshow_hide">-</span>
<span class="hideshow_title">Property Preferences</span>
<div id="hideshow_property_div" style="display: none;">
<table>
<tr><td>Paved: <td><input name="property-paved" type="text" size="3" onchange="formSetProperty('paved' ,'=');"><td>%<td><img alt="<" src="icons/waypoint-left.png" title="-" onmousedown="formSetProperty('paved' ,'-');">&ndash;/+<img alt=">" src="icons/waypoint-right.png" title="+" onmousedown="formSetProperty('paved' ,'+');">
<tr><td>Wiele pasów: <td><input name="property-multilane" type="text" size="3" onchange="formSetProperty('multilane' ,'=');"><td>%<td><img alt="<" src="icons/waypoint-left.png" title="-" onmousedown="formSetProperty('multilane' ,'-');">&ndash;/+<img alt=">" src="icons/waypoint-right.png" title="+" onmousedown="formSetProperty('multilane' ,'+');">
<tr><td>Most: <td><input name="property-bridge" type="text" size="3" onchange="formSetProperty('bridge' ,'=');"><td>%<td><img alt="<" src="icons/waypoint-left.png" title="-" onmousedown="formSetProperty('bridge' ,'-');">&ndash;/+<img alt=">" src="icons/waypoint-right.png" title="+" onmousedown="formSetProperty('bridge' ,'+');">
<tr><td>Tunel: <td><input name="property-tunnel" type="text" size="3" onchange="formSetProperty('tunnel' ,'=');"><td>%<td><img alt="<" src="icons/waypoint-left.png" title="-" onmousedown="formSetProperty('tunnel' ,'-');">&ndash;/+<img alt=">" src="icons/waypoint-right.png" title="+" onmousedown="formSetProperty('tunnel' ,'+');">
<tr><td>Trasa piesza:<td><input name="property-footroute" type="text" size="3" onchange="formSetProperty('footroute' ,'=');"><td>%<td><img alt="<" src="icons/waypoint-left.png" title="-" onmousedown="formSetProperty('footroute' ,'-');">&ndash;/+<img alt=">" src="icons/waypoint-right.png" title="+" onmousedown="formSetProperty('footroute' ,'+');">
<tr><td>Trasa rowerowa:<td><input name="property-bicycleroute" type="text" size="3" onchange="formSetProperty('bicycleroute','=');"><td>%<td><img alt="<" src="icons/waypoint-left.png" title="-" onmousedown="formSetProperty('bicycleroute','-');">&ndash;/+<img alt=">" src="icons/waypoint-right.png" title="+" onmousedown="formSetProperty('bicycleroute','+');">
</table>
</div>
</div>

<div class="hideshow_box">
<span id="hideshow_restriction_show" onclick="hideshow_show('restriction');" class="hideshow_show">+</span>
<span id="hideshow_restriction_hide" onclick="hideshow_hide('restriction');" class="hideshow_hide">-</span>
<span class="hideshow_title">Inne ograniczenia</span>
<div id="hideshow_restriction_div" style="display: none;">
<table>
<tr><td>Respektuj ulice jednokierunkowe:<td><input name="restrict-oneway" type="checkbox" onchange="formSetRestriction('oneway');">
<tr><td>Respektuj ograniczenia skrętu: <td><input name="restrict-turns" type="checkbox" onchange="formSetRestriction('turns' );">
</table>
<table>
<tr><td>Waga:<td><input name="restrict-weight" type="text" size="3" onchange="formSetRestriction('weight','=');"><td>tonnes<td><img alt="<" src="icons/waypoint-left.png" title="-" onmousedown="formSetRestriction('weight','-');">&ndash;/+<img alt=">" src="icons/waypoint-right.png" title="+" onmousedown="formSetRestriction('weight','+');">
<tr><td>Wysokość:<td><input name="restrict-height" type="text" size="3" onchange="formSetRestriction('height','=');"><td>metres<td><img alt="<" src="icons/waypoint-left.png" title="-" onmousedown="formSetRestriction('height','-');">&ndash;/+<img alt=">" src="icons/waypoint-right.png" title="+" onmousedown="formSetRestriction('height','+');">
<tr><td>Szerokość: <td><input name="restrict-width" type="text" size="3" onchange="formSetRestriction('width' ,'=');"><td>metres<td><img alt="<" src="icons/waypoint-left.png" title="-" onmousedown="formSetRestriction('width' ,'-');">&ndash;/+<img alt=">" src="icons/waypoint-right.png" title="+" onmousedown="formSetRestriction('width' ,'+');">
<tr><td>Długość:<td><input name="restrict-length" type="text" size="3" onchange="formSetRestriction('length','=');"><td>metres<td><img alt="<" src="icons/waypoint-left.png" title="-" onmousedown="formSetRestriction('length','-');">&ndash;/+<img alt=">" src="icons/waypoint-right.png" title="+" onmousedown="formSetRestriction('length','+');">
</table>
</div>
</div>

<div class="hideshow_box">
<span class="hideshow_title">Znajdź</span>
<input type="button" title="Znajdź najkrótsza trasę" id="shortest" value="Najkrótsza trasa" onclick="findRoute('shortest');" disabled="disabled">
<input type="button" title="Znajdź najdłuższą trasę" id="quickest" value="Najszybsza trasa" onclick="findRoute('quickest');" disabled="disabled">
</div>

<div class="hideshow_box">
<span class="hideshow_title">Połączenia</span>
<a id="permalink_url" href="router.html">Link to this map view</a>
<br>
<a id="edit_url" target="edit" style="display: none;">Edit this OSM data</a>
</div>

<div class="hideshow_box">
<span id="hideshow_help_options_show" onclick="hideshow_show('help_options');" class="hideshow_hide">+</span>
<span id="hideshow_help_options_hide" onclick="hideshow_hide('help_options');" class="hideshow_show">-</span>
<span class="hideshow_title">Pomoc</span>
<div id="hideshow_help_options_div">
<div class="scrollable">
<b>Quick Start</b>
<br>
Click on marker icons (above) to place them on the map (right). Then
drag them to the correct position. Zooming the map before placing the
markers is probably easiest. Alternatively type the latitude and
longitude into the boxes above.
<p>
Select the transport type, allowed highway types, speed limits, highway
properties and other restrictions from the options above.
Select "Shortest" or "Quickest" to calculate the route and display it
on the map.
<p>
<b>Waypoints</b>
<br>
Clicking on the marker icons will toggle the display of them on the map.
When a route is calculated it will visit (as close as possible
for the selected transport type) each of the waypoints that have
markers on the map in the order given.
<p>
<b>Transport Type</b>
<br>
Selecting a transport type will restrict the chosen route to
those on which it is allowed and set default values for the
other parameters.
<p>
<b>Highway Preferences</b>
<br>
The highway preference is selected as a percentage and routes are chosen that
try to follow the preferred highways.
For example if a "Primary" road is given a "110%" preference and a "Secondary"
road is given a "100%" preference then it means that a route on a Primary road
can be up to 10% longer than on a secondary road and still be selected.
<p>
<b>Speed Limits</b>
<br>
The speed limits chosen here for the different types of highway apply if the
highway has no other speed limit marked or it is higher than the chosen one.
<p>
<b>Property Preferences</b>
<br>
The property preference is selected as a percentage and routes are chosen that
try to follow highways with the preferred property.
For example if a "Paved" highway is given a "75%" preference then it means that
an unpaved highway is automatically given a "25%" preference so that a route on
a paved highway can be 3 times the length of an unpaved one and still be
selected.
<p>
<b>Other Restrictions</b>
<br>
These allow a route to be found that avoids marked limits on
weight, height, width or length. It is also possible to ignore
one-way restrictions (e.g. if walking).
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
<b><i>Nie uruchomiono wyznaczania trasy</i></b>
</div>
<div id="result_status_running" style="display: none;">
<b>Wyznaczanie trasy w trakcie...</b>
</div>
<div id="result_status_complete" style="display: none;">
<b>Trasa wyznaczona</b>
<br>
<a id="router_log_complete" target="router_log" href="#">Zobacz szczegóły</a>
</div>
<div id="result_status_error" style="display: none;">
<b>Błąd wyznaczania trasy</b>
<br>
<a id="router_log_error" target="router_log" href="#">Zobacz szczegóły</a>
</div>
<div id="result_status_failed" style="display: none;">
<b>Błąd uruchomienia wyznaczania trasy</b>
</div>
</div>
</div>

<div class="hideshow_box">
<span id="hideshow_shortest_show" onclick="hideshow_show('shortest');" class="hideshow_show">+</span>
<span id="hideshow_shortest_hide" onclick="hideshow_hide('shortest');" class="hideshow_hide">-</span>
<span class="hideshow_title">Najkrótsza trasa</span>
<div id="shortest_status">
<div id="shortest_status_no_info">
<b><i>Brak informacji</i></b>
</div>
<div id="shortest_status_info" style="display: none;">
</div>
</div>
<div id="hideshow_shortest_div" style="display: none;">
<div id="shortest_links" style="display: none;">
<table>
<tr><td>HTML directions: <td><a id="shortest_html" target="shortest_html" href="#">Open Popup</a>
<tr><td>Plik trasy w formacie GPX: <td><a id="shortest_gpx_track" target="shortest_gpx_track" href="#">Open Popup</a>
<tr><td>Plik nawigacji w formacie GPX: <td><a id="shortest_gpx_route" target="shortest_gpx_route" href="#">Open Popup</a>
<tr><td>Full text file: <td><a id="shortest_text_all" target="shortest_text_all" href="#">Open Popup</a>
<tr><td>Plik tekstowy: <td><a id="shortest_text" target="shortest_text" href="#">Open Popup</a>
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
<span class="hideshow_title">Najszybsza trasa</span>
<div id="quickest_status">
<div id="quickest_status_no_info">
<b><i>Brak informacji</i></b>
</div>
<div id="quickest_status_info" style="display: none;">
</div>
</div>
<div id="hideshow_quickest_div" style="display: none;">
<div id="quickest_links" style="display: none;">
<table>
<tr><td>HTML directions: <td><a id="quickest_html" target="quickest_html" href="#">Open Popup</a>
<tr><td>Plik trasy w formacie GPX: <td><a id="quickest_gpx_track" target="quickest_gpx_track" href="#">Open Popup</a>
<tr><td>Plik nawigacji w formacie GPX: <td><a id="quickest_gpx_route" target="quickest_gpx_route" href="#">Open Popup</a>
<tr><td>Full text file: <td><a id="quickest_text_all" target="quickest_text_all" href="#">Open Popup</a>
<tr><td>Plik tekstowy: <td><a id="quickest_text" target="quickest_text" href="#">Open Popup</a>
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
<span class="hideshow_title">Pomoc</span>
<div id="hideshow_help_route_div">
<div class="scrollable">
<b>Quick Start</b>
<br>
After calculating a route you can download the GPX file or plain
text route description (summary or detailed version). Also you
can view the route description and zoom in to selected parts.
<p>
<b>Problem Solving</b>
<br>
If the router completes with an error then the most likely cause is
that it is not possible to find a route between the selected points.
Moving one or more markers or changing the routing options should
allow a route to be found.
<p>
<b>Output Formats</b>
<br>
<dl>
<dt>HTML instructions
<dd>A description of the route to take with directions at each
important junction.
<dt>GPX track file
<dd>The same information that is displayed on the map with points
for every node and lines for every segment.
<dt>GPX route file
<dd>The same information that is displayed in text for the route
with a waypoint for each important junction in the route.
<dt>Full text file
<dd>A list of all of the nodes visited as well as the distance
between them and the cumulative distance for each step of the
route.
<dt>Text file
<dd>The same information that is displayed in text for the route.
</dl>
</div>
</div>
</div>
</div>


<div class="tab_content" id="tab_data_div" style="display: none;">
<div class="hideshow_box">
<span class="hideshow_title">Statystyki Routino</span>
<div id="statistics_data"></div>
<a id="statistics_link" href="statistics.cgi" onclick="displayStatistics();return(false);">Display data statistics</a>
</div>

<div class="hideshow_box">
<span class="hideshow_title">Wizualizer Routino</span>
To see Routino's view of the data there is a data visualiser that allows
displaying of the underlying data in various ways.
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
Kafelki: <span id="attribution_tile"></span>
</div>
</div>

</body>

</html>
