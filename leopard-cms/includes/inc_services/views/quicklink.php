<?php
/*
  $quicklink_content = '<p><strong>Choose quicklinks to display on page</strong></p>';

  $ql_sql = "SELECT
                  gp.`id`,
                  pmd.`quicklink_heading`,
                  pmd.`name`
              FROM
                  `general_pages` gp
              LEFT JOIN `page_meta_data` pmd 
              ON (gp.`page_meta_data_id` = pmd.`id`)
              WHERE pmd.`status` = 'A' 
              AND pmd.`quicklink_heading` != ''
              ORDER BY
                  pmd.`rank`";

  $quicklinks = fetch_all($ql_sql);

  //preprint_r($quicklinks);die;

  if( !empty($quicklinks) )
  {
      $attached_qls = fetch_value("SELECT GROUP_CONCAT(`quicklink_page_id`) FROM `service_has_quicklink` WHERE `service_id` = '{$id}'");

      $attached_qls_arr = explode(',', $attached_qls);

      $quicklink_content .= '<ul class="list-grid">';

      foreach($quicklinks as $quicklink)
      {
          $is_checked = (in_array($quicklink['id'], $attached_qls_arr)) ? ' checked="checked"' : '';

          $ql_label = ($quicklink['quicklink_heading']) ? $quicklink['quicklink_heading'] : $quicklink['name'];

          $quicklink_content .= '<li><label class="checkbox-inline"><input'.$is_checked.' type="checkbox" value="'.$quicklink['id'].'" name="quicklink_id[]"> <span>'.$ql_label.'</span></label></li>';
      }

      $quicklink_content .= '</ul>';
  }
*/
?>


<?php
##------------------------------------------------------------------------------------------------------
    ## Quick Links tab content
    $quicklink_content = '<p><strong>Choose quicklinks to display on page</strong></p>';

    $ql_sql = "SELECT
                    gp.`id`,
                    pmd.`quicklink_heading`,
                    pmd.`name`
                FROM
                    `general_pages` gp
                LEFT JOIN `page_meta_data` pmd ON
                    (gp.`page_meta_data_id` = pmd.`id`)
                WHERE pmd.`status` = 'A' 
                AND gp.`id` != '{$id}' 
                AND pmd.`quicklink_heading` != ''
                ORDER BY
                    pmd.`rank`";

    $quicklinks = fetch_all($ql_sql);

    //preprint_r($quicklinks);die;

    if( !empty($quicklinks) )
    {
        $attached_qls = fetch_value("SELECT GROUP_CONCAT(`quicklink_page_id`) FROM `page_has_quicklink` WHERE `page_id` = '{$page_meta_data_id}'");

        $attached_qls_arr = explode(',', $attached_qls);

        $quicklink_content .= '<ul class="list-grid">';

        foreach($quicklinks as $quicklink)
        {
            $is_checked = (in_array($quicklink['id'], $attached_qls_arr)) ? ' checked="checked"' : '';

            $ql_label = ($quicklink['quicklink_heading']) ? $quicklink['quicklink_heading'] : $quicklink['name'];

            $quicklink_content .= '<li><label class="checkbox-inline"><input'.$is_checked.' type="checkbox" value="'.$quicklink['id'].'" name="quicklink_id[]"> <span>'.$ql_label.'</span></label></li>';
        }

        $quicklink_content .= '</ul>';
    }
?>
