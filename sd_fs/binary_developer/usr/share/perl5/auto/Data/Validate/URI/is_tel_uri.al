# NOTE: Derived from blib/lib/Data/Validate/URI.pm.
# Changes made here will be lost when autosplit is run again.
# See AutoSplit.pm.
package Data::Validate::URI;

#line 442 "blib/lib/Data/Validate/URI.pm (autosplit into blib/lib/auto/Data/Validate/URI/is_tel_uri.al)"
# -------------------------------------------------------------------------------


sub is_tel_uri{
	my $self = shift if ref($_[0]); 
	my $value = shift;
	
	# extracted from http://tools.ietf.org/html/rfc3966#section-3

	my $hex_digit = '[a-fA-F0-9]'; # strictly hex digit does not allow lower case letters according to http://tools.ietf.org/html/rfc2234#section-6.1
	my $reserved = '[;/?:@&=+$,]';
	my $alphanum = '[A-Za-z0-9]';
	my $visual_separator = '[\-\.\(\)]';
	my $phonedigit_hex = '(?:' . $hex_digit . '|\*|\#|' . $visual_separator . ')';
	my $phonedigit = '(?:' . '\d' . '|' . $visual_separator . ')';
	my $param_unreserved = '[\[\]\/:&+$]';
	my $pct_encoded = '\\%' . $hex_digit . $hex_digit;
	my $mark = "[\-_\.!~*'()]";
	my $unreserved = '(?:' . $alphanum . '|' . $mark . ')';
	my $paramchar = '(?:' . $param_unreserved . '|' . $unreserved . '|' . $pct_encoded . ')';
	my $pvalue = $paramchar . '{1,}';
	my $pname = '(?:' . $alphanum . '|\\-){1,}';
	my $uric = '(?:' . $reserved . '|' . $unreserved . '|' . $pct_encoded . ')';
	my $alpha = '[A-Za-z]';
	my $toplabel = '(?:' . $alpha . '|' . $alpha . '(?:' . $alphanum . '|' . '\\-){0,}' . $alpha . ')';
	my $domainlabel = '(?:' . $alphanum . '|' . $alphanum . '(?:' . $alphanum . '|\\-){0,}' . $alphanum . ')';
	my $domainname = '(?:' . $domainlabel . '\\.){0,}' . $toplabel . '\\.{0,1}';

	# extracted from http://tools.ietf.org/html/rfc4694#section-4
	my $npdi = ';npdi';
	my $hex_phonedigit = '(?:' . $hex_digit . '|' . $visual_separator . ')';
	my $global_hex_digits = '\\+' . '\\d{1,3}' . $hex_phonedigit . '{0,}';
	my $global_rn = $global_hex_digits;
	my $rn_descriptor = '(?:' . $domainname . '|' . $global_hex_digits . ')';
	my $rn_context = ';rn-context=' . $rn_descriptor;
	my $local_rn = $hex_phonedigit . '{1,}' . $rn_context;
	my $global_cic = $global_hex_digits;
	my $cic_context = ';cic-context=' . $rn_descriptor;
	my $local_cic = $hex_phonedigit . '{1,}' . $cic_context;
	my $cic = ';cic=' . '(?:' . $global_cic . '|' . $local_cic . '){0,1}';
	my $rn = ';rn=' . '(?:' . $global_rn . '|' . $local_rn . '){0,1}';

	if ($value =~ /$rn.*$rn/xsm) {
		return;
	}
	if ($value =~ /$npdi.*$npdi/xsm) {
		return;
	}
	if ($value =~ /$cic.*$cic/xsm) {
		return;
	}
	my $parameter = '(?:;' . $pname . '(?:=' . $pvalue . ')|' . $rn . '|' . $cic . '|' . $npdi . ')';

	# end of http://tools.ietf.org/html/rfc4694#section-4

	my $local_number_digits = '(?:' . $phonedigit_hex . '{0,}' . '(?:' . $hex_digit . '|\*|\#)' . $phonedigit_hex . '{0,})';
	my $global_number_digits = '\+' . $phonedigit . '{0,}' . '[0-9]' . $phonedigit . '{0,}';
	my $descriptor = '(?:' . $domainname . '|' . $global_number_digits . ')';
	my $context = ';phone\-context=' . $descriptor;
	my $extension = ';ext=' . $phonedigit . '{1,}';
	my $isdn_subaddress = ';isub=' . $uric . '{1,}';

	# extracted from http://tools.ietf.org/html/rfc4759
	my $enum_dip_indicator = ';enumdi';
	if ($value =~ /$enum_dip_indicator.*$enum_dip_indicator/xsm) { # http://tools.ietf.org/html/rfc4759#section-3
		return;
	}

	# extracted from http://tools.ietf.org/html/rfc4904#section-5
	my $trunk_group_unreserved = '[/&+$]';
	my $escaped = '\\%' . $hex_digit . $hex_digit; # according to http://tools.ietf.org/html/rfc3261#section-25.1
	my $trunk_group_label = '(?:' . $unreserved . '|' . $escaped . '|' . $trunk_group_unreserved . '){1,}';
	my $trunk_group = ';tgrp=' . $trunk_group_label; 
	my $trunk_context = ';trunk\-context=' . $descriptor;


	my $par = '(?:' . $parameter . '|' . $extension . '|' . $isdn_subaddress . '|' . $enum_dip_indicator . '|' . $trunk_context . '|' . $trunk_group . ')';
	my $local_number = $local_number_digits . $par . '{0,}' . $context . $par . '{0,}';
	my $global_number = $global_number_digits . $par . '{0,}';
	my $telephone_subscriber = '(?:' . $global_number . '|' . $local_number . ')';
	my $telephone_uri = 'tel:' . $telephone_subscriber;

	if ($value =~ /^($telephone_uri)$/xsm) {
		my ($untainted) = ($1);
		return $untainted;
	} else {
		return;
	}
}

# end of Data::Validate::URI::is_tel_uri
1;
