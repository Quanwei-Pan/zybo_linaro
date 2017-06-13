# NOTE: Derived from blib/lib/Data/Validate/URI.pm.
# Changes made here will be lost when autosplit is run again.
# See AutoSplit.pm.
package Data::Validate::URI;

#line 391 "blib/lib/Data/Validate/URI.pm (autosplit into blib/lib/auto/Data/Validate/URI/is_web_uri.al)"
# -------------------------------------------------------------------------------


sub is_web_uri{
	my $self = shift if ref($_[0]); 
	my $value = shift;
	
	my $h = is_http_uri($value);
	return $h if defined $h;
	
	return is_https_uri($value);
}

# end of Data::Validate::URI::is_web_uri
1;
