<?php

if($page_contact->id == $page_id){
    $tags_arr['body_cls'] .= ' contact-page';
}

$error_cls = ' has-error';

$fname_error_class   = ($fname_error) ? $error_cls : '';
$lname_error_class   = ($lname_error) ? $error_cls : '';
$email_error_class   = ($email_address_error) ? $error_cls : '';
$subject_error_class = ($subject_error) ? $error_cls : '';
$message_error_class = ($message_error) ? $error_cls : '';

$subject_dropdown_array = ['Australia', 'New Zealand', 'Pacific', 'General'];

$subject_dropdown = '<select id="subject" name="subject" tabindex="5">
                     <option value=""></option>';
foreach($subject_dropdown_array as $item){
    if($subject == $item){
        $subject_dropdown .= '<option value="'.$item.'" selected>'.$item.'</option>';
    }
    $subject_dropdown .= '<option value="'.$item.'">'.$item.'</option>';
}
$subject_dropdown .= '</select>';

$tags_arr['js_code_head_close'] .= '<script src="https://www.google.com/recaptcha/api.js" async defer></script>';

if( $tags_arr['content'] )
{

    $output = '<div class="col-xs-12 col-md-12 col-lg-12 contact-body-content">'.$tags_arr['content'].'</div>';

}

$subject         = $subject;
$subject_disable = '';
if(isset($_GET['subject'])) {
    $subject = $_GET['subject'];
    $subject_disable = 'readonly';
}

$output .= <<< H

<div class="col-xs-12 text-left">
    <p><span class="text-danger"><span class="text-danger">*</span></span> Indicates a required field</p>
    <form action="{$fromroot}/{$page}" method="post" role="form" class="contact-us full-form">
        <fieldset class="form__fieldset"> 
        <div class="twocol">
            <div class="form__group {$fname_error_class}">
                <label for="first-name" class="control-label">First Name<span class="text-danger">*</span></label>
                <input type="text" id="fname" value="$fname" class="form__control" name="fname" tabindex="1">
                {$fname_error_msg}
            </div>
            <div class="form__group {$lname_error_class}">
                <label for="last-name" class="control-label">Last Name<span class="text-danger">*</span></label>
                <input type="text" id="name" value="$lname" class="form__control" name="lname" tabindex="2">
                {$lname_error_msg}
            </div>
            <div class="form__group {$email_error_class}">
                <label for="email-address" class="control-label">Email<span class="text-danger">*</span></label>
                <input type="email" id="email-address" value="$email_address" class="form__control" name="email-address" tabindex="3">
                {$email_address_error_msg}
            </div>
            <div class="form__group {$phone_error_class}">
                <label for="phone" class="control-label">Phone</label>
                <input type="text" id="phone" value="$phone" class="form__control" name="phone" tabindex="4">
                {$phone_error_msg}
            </div>
            <div class="form__group {$subject_error_class}">
                <label for="subject" class="control-label">Subject<span class="text-danger">*</span></label>
                <input type="text" id="subject" value="$subject" class="form__control" name="subject" tabindex="4" {$subject_disable}>
                {$subject_error_msg}
            </div>
        </div>
        <div class="twocol">
            <div class="form__group {$message_error_class}">
                <label for="message" class="control-label">Description <span class="text-danger">*</span></label>
                <textarea name="message" id="message" class="form__control" tabindex="5" rows="4" style="height:150px;">{$message}</textarea>
            </div>
            <div class="form__group {$captcha_error_class}">
                <div class="controls">
                    <div class="g-recaptcha" data-sitekey="6Ler7lkUAAAAACGGEn5c-lwzZifpJ5FSbbMMgcZC"></div>
                    <span class="help-inline">{$captcha_error_msg}</span>
                </div>
            </div>
            <div class="form__group">
                <button type="submit" class="btn btn--green" name="continue" value="1" tabindex="8"><strong>Enquire Now</strong></button>
            </div>
        </div>
        </fieldset>
    </form>
</div>

H;


?>