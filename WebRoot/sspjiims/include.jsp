<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<%@ taglib prefix="s" uri="/struts-tags" %>
<link rel="shortcut icon" href="favicon.ico" />

<!-- Stylesheets -->

<link rel="stylesheet" type="text/css" media="all" href="css/reset.css" />
<link rel="stylesheet" type="text/css" media="all" href="css/style.css" />
<link rel="stylesheet" type="text/css" media="all" href="css/superfish.css" />
<link href="css/tablestyle.css" type="text/css" rel="stylesheet" />

<!-- Color Stylesheets -->
<!-- <link rel="stylesheet" type="text/css" media="all" href="colors/grey.css" /> -->
<!-- <link rel="stylesheet" type="text/css" media="all" href="colors/rainbow.css" /> -->

<link rel="stylesheet" type="text/css" media="all"
	href="colors/blue.css" />
<!-- <link rel="stylesheet" type="text/css" media="all" href="colors/green.css" /> -->

<!-- jQuery framework and utilities -->
<script type="text/javascript" src="js/jquery-1.4.2.min.js"></script>
<script type="text/javascript" src="js/jquery.easing.1.3.js"></script>

<!-- (cufn) Font Replacement -->
<script type="text/javascript" src="font/cufon-yui.js"></script>
<script type="text/javascript" src="font/vegur_400-vegur_700.font.js"></script>

<!--Silder-->
<script src="js/jqFancyTransitions.1.8.js" type="text/javascript"></script>

<!-- Superfish Menu-->

<script type="text/javascript" src="js/superfish.js"></script>
<script type="text/javascript" src="js/hoverIntent.js"></script>
<script type="text/javascript">
	jQuery(function() {

		jQuery('ul.sf-menu').superfish();

		Cufon.replace('h1, h2, h3, h4, h5, .sf-menu, .subheader_right p', {

			hover : true
		})

	});

	function MM_validateForm() { //v4.0

		if (document.getElementById) {

			var i, p, q, nm, test, num, min, max, errors = '', args = MM_validateForm.arguments;

			for (i = 0; i < (args.length - 2); i += 3) {
				test = args[i + 2];
				val = document.getElementById(args[i]);

				if (val) {
					nm = val.name;
					if ((val = val.value) != "") {

						if (test.indexOf('isEmail') != -1) {
							p = val.indexOf('@');

							if (p < 1 || p == (val.length - 1))
								errors += '- ' + nm
										+ ' must contain an e-mail address.\n';

						} else if (test != 'R') {
							num = parseFloat(val);

							if (isNaN(val))
								errors += '- ' + nm
										+ ' must contain a number.\n';

							if (test.indexOf('inRange') != -1) {
								p = test.indexOf(':');

								min = test.substring(8, p);
								max = test.substring(p + 1);

								if (num < min || max < num)
									errors += '- ' + nm
											+ ' must contain a number between '
											+ min + ' and ' + max + '.\n';

							}
						}
					} else if (test.charAt(0) == 'R')
						errors += '- ' + nm + ' is required.\n';
				}

			}
			if (errors)
				alert('The following error(s) occurred:\n' + errors);

			document.MM_returnValue = (errors == '');

		}
	}
</script>



<!-- Nivo Slider -->

<link rel="stylesheet" type="text/css" href="css/nivo-slider.css"
	media="screen" />

<!-- Nivo Slider -->

<!--[if IE 6]>

<script type="text/javascript" src="unitpngfix.js"></script>

<![endif]-->

<link rel="stylesheet" type="text/css" href="shadowbox/shadowbox.css">
<script type="text/javascript" src="shadowbox/shadowbox.js"></script>

<script type="text/javascript">
	Shadowbox.init();
</script>

<script type="text/javascript">
	function goToAnchor() {
		//location.href = "#enquiry";
	}
</script>

<!--Start of Zopim Live Chat Script-->
<script type="text/javascript">
	
</script>
<!--End of Zopim Live Chat Script-->

<script type="text/javascript">
	var _gaq = _gaq || [];
	_gaq.push([ '_setAccount', 'UA-17358932-33' ]);
	_gaq.push([ '_trackPageview' ]);

	(function() {
		var ga = document.createElement('script');
		ga.type = 'text/javascript';
		ga.async = true;
		ga.src = ('https:' == document.location.protocol ? 'https://ssl'
				: 'http://www')
				+ '.google-analytics.com/ga.js';
		var s = document.getElementsByTagName('script')[0];
		s.parentNode.insertBefore(ga, s);
	})();
</script>