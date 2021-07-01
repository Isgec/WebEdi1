<%@ Control Language="VB" AutoEventWireup="true" CodeFile="tblDMSview.ascx.vb" Inherits="tblDMSview" %>
<style>
  .nt-mnu-but{
    padding:3px;
  }
  .gvp-silver{
  height: 30px;
  background: #d8e0de; /* Old browsers */
  background: -moz-linear-gradient(top, #d8e0de 0%, #aebfbc 3%, #99afab 41%, #8ea6a2 65%, #829d98 95%, #4e5c5a 98%, #0e0e0e 100%); /* FF3.6-15 */
  background: -webkit-linear-gradient(top, #d8e0de 0%,#aebfbc 3%,#99afab 41%,#8ea6a2 65%,#829d98 95%,#4e5c5a 98%,#0e0e0e 100%); /* Chrome10-25,Safari5.1-6 */
  background: linear-gradient(to bottom, #d8e0de 0%,#aebfbc 3%,#99afab 41%,#8ea6a2 65%,#829d98 95%,#4e5c5a 98%,#0e0e0e 100%); /* W3C, IE10+, FF16+, Chrome26+, Opera12+, Safari7+ */
  filter: progid:DXImageTransform.Microsoft.gradient( startColorstr='#d8e0de', endColorstr='#0e0e0e',GradientType=0 ); /* IE6-9 */

  }
  .tbltxt{
    border:1pt solid #d3d3d3;
    background-color:#edeaea;
    color:#808080;
  }
</style>
<div class="nt-row gvp-silver" style="justify-content:space-between;">
	<div class="nt-row">
	</div>
	<div id="tdPage" runat="server" class="nt-row">
		<div class="nt-mnu-but">
			<asp:ImageButton ID="navFirst" ToolTip="First" AccessKey="T" runat="server" ImageUrl="~/TblImages/first0.png" onmouseover="this.src='../../tblimages/first2.png';" onmouseout="this.src='../../tblimages/first0.png';" />
		</div>
		<div class="nt-mnu-but">
			<asp:ImageButton ID="navPrev" ToolTip="Previous" AccessKey="P" runat="server" ImageUrl="~/TblImages/prev0.png" onmouseover="this.src='../../tblimages/prev2.png';" onmouseout="this.src='../../tblimages/prev0.png';" />
		</div>
		<div class="nt-mnu-but">
			<asp:TextBox ID="_CurrentPage" runat="server" CssClass="tbltxt" MaxLength="5" Width="40px" Text="1" AutoPostBack="True" onfocus = "return this.select();" onblur="return dc(this,0);" />
		</div>
		<div class="nt-mnu-but" style="padding:6px;">
			<asp:Label ID="Label1" runat="server" Text="#of" />
		</div>
		<div class="nt-mnu-but" style="padding:6px;">
			<asp:Label ID="_TotalPages" runat="server" Width="25px" />
		</div>
		<div class="nt-mnu-but" style="padding:6px;">
			<asp:Label ID="Label2" runat="server" Text="Pages" />
		</div>
		<div class="nt-mnu-but">
			<asp:ImageButton ID="navNext" ToolTip="Next" AccessKey="N" runat="server" ImageUrl="~/TblImages/next0.png" onmouseover="this.src='../../tblimages/next2.png';" onmouseout="this.src='../../tblimages/next0.png';" />
		</div>
		<div class="nt-mnu-but">
			<asp:ImageButton ID="navLast" ToolTip="Last" AccessKey="L" runat="server" ImageUrl="~/TblImages/last0.png" onmouseover="this.src='../../tblimages/last2.png';" onmouseout="this.src='../../tblimages/last0.png';" />
		</div>
		<div class="nt-mnu-but">
			<asp:TextBox ID="_PageSize" runat="server" CssClass="tbltxt" MaxLength="5" Width="40px" ValidationGroup="currentpage" onfocus = "return this.select();" onblur="return dc(this,0);" />
		</div>
		<div class="nt-mnu-but" style="padding:6px;">
			<asp:LinkButton ID="_PageSizeButton" runat="server" CommandName="PageSize" Text="/Page" />
		</div>
	</div>
	<div id="tdSearch" runat="server" class="nt-row">
		<div class="nt-mnu-but">
			<asp:CheckBox ID="DisableSearch" runat="server" Enabled="false" AutoPostBack="true" ToolTip="Uncheck for normal view." />
		</div>
		<div class="nt-mnu-but">
			<asp:TextBox ID="SearchTextBox" runat="server" CssClass="tbltxt" ToolTip="Enter keywords to search." Width="80px" MaxLength="250" placeholder="[Search]" />
		</div>
		<div class="nt-mnu-but">
			<asp:ImageButton ID="CmdSearch" runat="server" ImageUrl="~/TblImages/srh0.png" onmouseover="this.src='../../tblimages/srh2.png';" onmouseout="this.src='../../tblimages/srh0.png';" AlternateText="Search" ToolTip="Click to search" />
		</div>
	</div>
</div>
