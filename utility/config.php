<?php

require_once('constants.php');

$online       = 'Y';                                  ## Online?   Yes='Y'   No='N'
    
## DIRECTORIES
$fromroot     = '';  ## Use this when a website is being tested (e.g. 'http://www.website.com/testarea/index.php' would be '/testarea')

// CLIENTSIDE PERSPECTIVE

$admin_dir    = 'leopard-cms';

$htmlrootfull = "http://www.leopard.co.nz";
$htmlroot     = "$htmlrootfull$fromroot";
$htmladmin    = "$htmlroot/{$admin_dir}";
$httpsadmin   = "https://".$_SERVER['HTTP_HOST'].$fromroot.'/'.$admin_dir;

// SERVERSIDE PERSPECTIVE

$rootfull     = "/var/www/hosting/tomahawk/leopard";
$root         = "$rootfull$fromroot";
$rootadmin    = "$root/{$admin_dir}";

## DATABASE
$db_host      = 'localhost';
$db_user      = 'leopard_user';
$db_pwd       = 'rEkkTnUCVTDV';
$db_name      = 'leopard_db';


$debug        = true;
$mobile_url   = '';


$local_ip_addresses = array('127.0.0.1', '114.23.241.67');
$is_local           = in_array( getenv('REMOTE_ADDR') , $local_ip_addresses);

############################################################################################################################
## Directories
############################################################################################################################

## Image Directory
$imgurl          = "$root/library";
$imgurl_admin    = "$rootadmin/library";
$imgurl_html     = "$htmlroot/images";

## Template Directory
$tmpldir         = "$root/templates";
$tmpldir_admin   = "$rootadmin/templates";
$tmpldir_html    = "$htmlroot/templates";

## Modules Directory
$moddir          = "$root/modules";
$moddir_html     = "$htmlroot/modules";
$moddir_admin    = "$rootadmin/modules";

## Includes Directory
$incdir          = "$root/includes";
$incdir_admin    = "$rootadmin/includes";

## functions Directory
$funcdir         = "$root/functions";
$funcdir_admin   = "$rootadmin/functions";

## Utility Directory
$utildir         = "$root/utility";
$utildir_admin   = "$rootadmin/utility";

## Assets Directory
$assetsdir       = "$root/assets";
$assetsdir_admin = "$rootadmin/assets";

## Services Directory
$classdir        = "$root/classes";
$classdir_admin  = "$rootadmin/classes";

## AJAX Directory
$ajaxdir         = "$root/ajax";
$ajaxdir_admin   = "$rootadmin/ajax";
$ajaxdir_html    = "$htmlroot/ajax";

## Creating the Database Connections
@include_once("CConnection.php");

include_once($funcdir.'/func_all.php');

## To use another directory just add the prefix of the directory variable (in this case 'funcdir')
$c_Connection = new CConnection();
$c_Connection->Configure($db_host, $db_name, $db_user, $db_pwd);


############################################################################################################################
## Script Processing
############################################################################################################################

## Error Reporting?
$error_reporting  = 'Y';
## Notice Reporting?
$notice_reporting = 'N';

if(strtolower($error_reporting)=='y')
{
    if(strtolower($notice_reporting)=='y')
    {
        ini_set('error_reporting', E_ALL);
    }
    else
    {
        ini_set('error_reporting', E_ALL & ~E_NOTICE);
    }
    ini_set('display_errors', E_ALL);
}
else
{
    ini_set('display_errors', E_ALL);
}


?>