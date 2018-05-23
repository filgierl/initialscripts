UPDATE wp_options SET option_value = replace(option_value, 'http://AppLoadBalancer-395269681.eu-central-1.elb.amazonaws.com', 'http://n22002.comcute.eti.pg.gda.pl') WHERE option_name = 'home' OR option_name = 'siteurl';

UPDATE wp_posts SET guid = replace(guid, 'http://AppLoadBalancer-395269681.eu-central-1.elb.amazonaws.com','http://n22002.comcute.eti.pg.gda.pl');

UPDATE wp_posts SET post_content = replace(post_content, 'http://AppLoadBalancer-395269681.eu-central-1.elb.amazonaws.com', 'http://n22002.comcute.eti.pg.gda.pl');

UPDATE wp_postmeta SET meta_value = replace(meta_value,'http://AppLoadBalancer-395269681.eu-central-1.elb.amazonaws.com','http://n22002.comcute.eti.pg.gda.pl');


