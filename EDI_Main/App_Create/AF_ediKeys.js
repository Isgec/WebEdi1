<script type="text/javascript"> 
var script_ediKeys = {
    validate_EdiKey: function(sender) {
      var Prefix = sender.id.replace('EdiKey','');
      this.validatePK_ediKeys(sender,Prefix);
      },
    validatePK_ediKeys: function(o,Prefix) {
      var value = o.id;
      try{$get(Prefix.replace('_F_','') + '_L_ErrMsgediKeys').innerHTML = '';}catch(ex){}
      var EdiKey = $get(Prefix + 'EdiKey');
      if(EdiKey.value=='')
        return true;
      value = value + ',' + EdiKey.value ;
      o.style.backgroundImage  = 'url(../../images/pkloader.gif)';
      o.style.backgroundRepeat= 'no-repeat';
      o.style.backgroundPosition = 'right';
      PageMethods.validatePK_ediKeys(value, this.validatedPK_ediKeys);
    },
    validatedPK_ediKeys: function(result) {
      var p = result.split('|');
      var o = $get(p[1]);
      o.style.backgroundImage  = 'none';
      if(p[0]=='1'){
        try{$get('cph1_FVediKeys_L_ErrMsgediKeys').innerHTML = p[2];}catch(ex){}
        o.value='';
        o.focus();
      }
    },
    temp: function() {
    }
    }
</script>
