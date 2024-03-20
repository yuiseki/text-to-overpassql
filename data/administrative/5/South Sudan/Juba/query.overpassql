[out:json][timeout:30000];
area["name:en"="South Sudan"]->.searchArea;
(
  relation["boundary"="administrative"]["name"="Juba"](area.searchArea);
);
out geom;
