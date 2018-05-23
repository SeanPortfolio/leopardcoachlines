<?php

$tags_arr['body_cls'] .= ' blog-page';

$ouput_view      = '';
$posts_view      = '';
$extra_view      = '';
$panels_view     = '';
$pagination_view = '';
$max_rows        = 5;
$query_string    = 'page';
$current_page    =  (isset($_GET[$query_string])) ? $_GET[$query_string] : 1;
$is_single       = false;

$segment1 = "option{$page_index}";
$segment1 = $$segment1;

$segment2 = "option".($page_index+1);
$segment2 = $$segment2;

$segment3 = "option".($page_index+2);
$segment3 = $$segment3;

if( ($segment1 && $segment2) && in_array( $segment1, array('archive', 'author', 'post', 'category') ) )
{
	
	switch ($segment1)
	{
		case 'author':
			require_once 'author_archive.php';
		break;
		case 'category':
			require_once 'category_archive.php';
		break;
		case 'archive':
			require_once 'archive.php';
		break;
		case 'post':
			require_once 'post.php';
		break;

	}	

}
else
{
	require_once 'posts.php';
}


require_once 'generate_view.php';

require_once 'panels/posts.php';
require_once 'panels/archives.php';
require_once 'panels/category.php';

$tags_arr['ex_meta_taga'] .= "\n".'	<meta property="og:type" content="blog"/>';

$ouput_view = <<< HTML
	<section class="section section-bg-white">
		<div class="container-fluid container--fluid-fw">
			<div class="row">
				<div class="col-xs-12 col-md-8">
					{$posts_view}
					{$pagination_view}
				</div>
				<div class="col-xs-12 col-md-4 text-left">
					{$panels_view}
				</div>
			</div>
		</div>
		{$extra_view}
	</section>
HTML;


$tags_arr['content'] .= $ouput_view;
?>