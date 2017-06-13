# NOTE: Derived from blib/lib/Data/Validate/URI.pm.
# Changes made here will be lost when autosplit is run again.
# See AutoSplit.pm.
package Data::Validate::URI;

#line 255 "blib/lib/Data/Validate/URI.pm (autosplit into blib/lib/auto/Data/Validate/URI/is_http_uri.al)"
# -------------------------------------------------------------------------------


sub is_http_uri{
	my $self = shift if ref($_[0]); 
	my $value = shift;
	my $allow_https = shift;
	
	return unless is_uri($value);
	
	my($scheme, $authority, $path, $query, $fragment) = _split_uri($value);
	
	return unless $scheme;
	
	if($allow_https){
		return unless lc($scheme) eq 'https';
	} else {
		return unless lc($scheme) eq 'http';
	}
	
	# fully-qualified URIs must have an authority section that is
	# a valid host
	return unless($authority);
	
	# allow a port component
	my($port) = $authority =~ /:(\d+)$/;
	$authority =~ s/:\d+$//;
	
	# modifying this to allow the (discouraged, but still legal) use of IP addresses
	unless(Data::Validate::Domain::is_domain($authority) || Data::Validate::IP::is_ipv4($authority)){
		return;
	}
	
	# re-assemble the URL per section 5.3 in RFC 3986
	my $out = $scheme . ':';
	$out .= '//' . $authority;
	
	$out .= ':' . $port if $port;
	
	$out .= $path;
	
	if(defined $query && length($query)){
		$out .= '?' . $query;
	}
	if(defined $fragment && length($fragment)){
		$out .= '#' . $fragment;
	}
	
	return $out;
	
}

# end of Data::Validate::URI::is_http_uri
1;
