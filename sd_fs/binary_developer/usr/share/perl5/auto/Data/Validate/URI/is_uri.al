# NOTE: Derived from blib/lib/Data/Validate/URI.pm.
# Changes made here will be lost when autosplit is run again.
# See AutoSplit.pm.
package Data::Validate::URI;

#line 152 "blib/lib/Data/Validate/URI.pm (autosplit into blib/lib/auto/Data/Validate/URI/is_uri.al)"
# -------------------------------------------------------------------------------


sub is_uri{
	my $self = shift if ref($_[0]); 
	my $value = shift;
	
	return unless defined($value);
	
	# check for illegal characters
	return if $value =~ /[^a-z0-9\:\/\?\#\[\]\@\!\$\&\'\(\)\*\+\,\;\=\.\-\_\~\%]/i;
	
	# check for hex escapes that aren't complete
	return if $value =~ /%[^0-9a-f]/i;
	return if $value =~ /%[0-9a-f](:?[^0-9a-f]|$)/i;
	
	# from RFC 3986
	my($scheme, $authority, $path, $query, $fragment) = _split_uri($value);
	
	# scheme and path are required, though the path can be empty
	return unless (defined($scheme) && length($scheme) && defined($path));
	
	# if authority is present, the path must be empty or begin with a /
	if(defined($authority) && length($authority)){
		return unless(length($path) == 0 || $path =~ m!^/!);
	
	} else {
		# if authority is not present, the path must not start with //
		return if $path =~ m!^//!;
	}
	
	# scheme must begin with a letter, then consist of letters, digits, +, ., or -
	return unless lc($scheme) =~ m!^[a-z][a-z0-9\+\-\.]*$!;
	
	# re-assemble the URL per section 5.3 in RFC 3986
	my $out = $scheme . ':';
	if(defined $authority && length($authority)){
		$out .= '//' . $authority;
	}
	$out .= $path;
	if(defined $query && length($query)){
		$out .= '?' . $query;
	}
	if(defined $fragment && length($fragment)){
		$out .= '#' . $fragment;
	}
	
	return $out;
	
}

# end of Data::Validate::URI::is_uri
1;
