[out:json][timeout:30000];
area["name:en"="Tokyo"]->.searchArea;
(
  relation["boundary"="administrative"]["name:en"="Chuo"](area.searchArea);
);
out geom;
