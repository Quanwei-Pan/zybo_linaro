# NOTE: Derived from blib/lib/Data/Validate/URI.pm.
# Changes made here will be lost when autosplit is run again.
# See AutoSplit.pm.
package Data::Validate::URI;

#line 532 "blib/lib/Data/Validate/URI.pm (autosplit into blib/lib/auto/Data/Validate/URI/_split_uri.al)"
# internal URI spitter method - direct from RFC 3986
sub _split_uri{
	my $value = shift;
	
	my @bits = $value =~ m|(?:([^:/?#]+):)?(?://([^/?#]*))?([^?#]*)(?:\?([^#]*))?(?:#(.*))?|;
	
	return @bits;
}

1;
# end of Data::Validate::URI::_split_uri
