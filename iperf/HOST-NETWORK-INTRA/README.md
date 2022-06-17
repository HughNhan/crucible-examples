# Configure HOST-NETWORK-INTRA
 - run.sh: "topo=intranode"
 - mv-params.json: server ifname is "br-ex" 

	{
	  "global-options": [
	    {
	      "name": "common-params",
	      "params": [
	        { "arg": "ifname", "vals": ["eth0"], "role": "server" } <====
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

