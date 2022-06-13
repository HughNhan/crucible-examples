# Configure INGRESS
 - run.sh: "topo:ingress", ocphost, bmlhosta
 - mv-params.json: adjust ifname of server: "eth0". Also make sure the remotehost FW/iptables do not block this traffic.

	{
	  "global-options": [
	    {
	      "name": "common-params",
	      "params": [
	        { "arg": "time", "vals": ["10"] },
	        { "arg": "protocol", "vals": ["tcp", "udp"] },
	        { "arg": "ifname", "vals": ["eth0"], "role": "server" } 
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
