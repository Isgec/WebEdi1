<script type="text/javascript"> 
var script_ediQueues = {
    ACEEdiKey_Selected: function(sender, e) {
      var Prefix = sender._element.id.replace('EdiKey','');
      var F_EdiKey = $get(sender._element.id);
      var F_EdiKey_Display = $get(sender._element.id + '_Display');
      var retval = e.get_value();
      var p = retval.split('|');
      F_EdiKey.value = p[0];
      F_EdiKey_Display.innerHTML = e.get_text();
    },
    ACEEdiKey_Populating: function(sender,e) {
      var p = sender.get_element();
      var Prefix = sender._element.id.replace('EdiKey','');
      p.style.backgroundImage  = 'url(../../images/loader.gif)';
      p.style.backgroundRepeat= 'no-repeat';
      p.style.backgroundPosition = 'right';
      sender._contextKey = '';
    },
    ACEEdiKey_Populated: function(sender,e) {
      var p = sender.get_element();
      p.style.backgroundImage  = 'none';
    },
    validate_EdiKey: function(sender) {
      var Prefix = sender.id.replace('EdiKey','');
      this.validated_FK_EDI_Queues_EDIKey_main = true;
      this.validate_FK_EDI_Queues_EDIKey(sender,Prefix);
      },
    validate_FK_EDI_Queues_EDIKey: function(o,Prefix) {
      var value = o.id;
      var EdiKey = $get(Prefix + 'EdiKey');
      if(EdiKey.value==''){
        if(this.validated_FK_EDI_Queues_EDIKey_main){
          var o_d = $get(Prefix + 'EdiKey' + '_Display');
          try{o_d.innerHTML = '';}catch(ex){}
        }
        return true;
      }
      value = value + ',' + EdiKey.value ;
        o.style.backgroundImage  = 'url(../../images/pkloader.gif)';
        o.style.backgroundRepeat= 'no-repeat';
        o.style.backgroundPosition = 'right';
        PageMethods.validate_FK_EDI_Queues_EDIKey(value, this.validated_FK_EDI_Queues_EDIKey);
      },
    validated_FK_EDI_Queues_EDIKey_main: false,
    validated_FK_EDI_Queues_EDIKey: function(result) {
      var p = result.split('|');
      var o = $get(p[1]);
      if(script_ediQueues.validated_FK_EDI_Queues_EDIKey_main){
        var o_d = $get(p[1]+'_Display');
        try{o_d.innerHTML = p[2];}catch(ex){}
      }
      o.style.backgroundImage  = 'none';
      if(p[0]=='1'){
        o.value='';
        o.focus();
      }
    },
    temp: function() {
    }
    }
</script>
