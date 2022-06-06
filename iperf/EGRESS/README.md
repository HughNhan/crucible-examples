# Configure EGRESS
 - run.sh: "topo:egress", ocphost, bmlhosta
 - mv-params.json: fix ifname of server i.e. enf8f0

	{
	  "global-options": [
	    {
	      "name": "common-params",
	      "params": [
	        { "arg": "time", "vals": ["10"] },
	        { "arg": "protocol", "vals": ["tcp", "udp"] },
	        { "arg": "ifname", "vals": ["ens8f0"], "role": "server" } 
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
	        { "arg": "bitrate", "vals": ["5G"], "role": "client" }
	      ]
	    }
	  ]
	}
