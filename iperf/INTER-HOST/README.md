# Configure INTER HOST
 - run.sh: "topo=interhost"
 - mv-params.json: server ifname i.e "eno2"

	{
	  "global-options": [
	    {
	      "name": "common-params",
	      "params": [
	        { "arg": "ifname", "vals": ["eno2"], "role": "server" } <====
	      ]
	    }
	  ],
	  "sets": [
	    {
	      "include": "common-params",
	      "params": [
	        { "arg": "length", "vals": [ "16K"] },
	        { "arg": "bitrate", "vals": ["5G"], "role": "client" }
	      ]
	    },
	    {
	      "include": "common-params",
	      "params": [
	        { "arg": "length", "vals": [ "16K"] },
	        { "arg": "bitrate", "vals": ["5G"], "role": "client" },
	        { "arg": "passthru", "vals": ["--reverse"], "role": "client" }
	      ]
	    }
	  ]
	}

