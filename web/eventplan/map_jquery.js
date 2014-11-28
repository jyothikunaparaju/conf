/* 
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

 $(document).ready(function(){
   $('#stndrUrl').click( function() {
    window.location = $(this).attr('href') + '/' + $('#appendUrl').val();
    return false;
});
 });
 