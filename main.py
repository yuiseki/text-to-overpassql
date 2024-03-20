
text_to_overpassql_list = []

text_to_overpassql = {
        "text": "Show me Sudan",
        "overpassql": """
        [out:json][timeout:30000];
        relation["boundary"="administrative"]["admin_level"=2]["name:en"="Sudan"];
        out geom;
        """
    }