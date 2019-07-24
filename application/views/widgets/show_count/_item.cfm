



<cfparam name="args.number"  default="" />
<cfparam name="args.title"  default="" />
<cfparam name="args.icon"  default="" />

<cfscript>
offset = 0;
layout = 12;
switch(prc.layout) {
    case "1": 
        offset = 0;
        layout = 12;
        break; 
    case "2": 
        offset = 0;
        layout = 6;
        break; 
    case "3":
        offset = 0;
        layout = 4;
        break; 
    case "4":
        offset = 0;
        layout = 3;
        break; 
    case "5":
        offset = 1;
        layout = 2;
        break; 
    case "6":
        offset = 0;
        layout = 2;
        break; 
    default: 
        offset = 0;
        layout = 12;
        break; 
 }
</cfscript>
<cfoutput>
    <div class="col-md-#layout# col-md-offset-#offset#">
        <div class="icon-box counter-box-icon">
            <div class="icon-box-cell">
                <i class="fa #args.icon# text-xl"></i>
            </div>
            <div class="icon-box-cell">
                <label class="counter text-l" data-speed="5000" data-to="#args.number#">#args.number#</label>
                <p>#args.title#</p>
            </div>
        </div>
    </div>
</cfoutput>