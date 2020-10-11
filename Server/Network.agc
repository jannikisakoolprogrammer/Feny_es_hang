
TYPE Network_NetworkInfo
	ip_address_ipv6 AS STRING
	name AS STRING
	port_ipv4 AS INTEGER
	port_ipv6 AS INTEGER
ENDTYPE


FUNCTION Network_CreateNetworkInfo(_ip_address_ipv6 AS STRING,
							   _name AS STRING,
							   _port_ipv4 AS INTEGER,
							   _port_ipv6 AS INTEGER)
							   
	network_info AS Network_NetworkInfo
	
	network_info.ip_address_ipv6 = _ip_address_ipv6
	network_info.name = _name
	network_info.port_ipv4 = _port_ipv4
	network_info.port_ipv6 = _port_ipv6
	
ENDFUNCTION network_info
