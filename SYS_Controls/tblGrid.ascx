<%@ Control Language="VB" AutoEventWireup="true" CodeFile="tblGrid.ascx.vb" Inherits="tblGrid" %>

<div class="nt-row" style="justify-content:space-between;">
	<div class="nt-row">
		<div class="nt-tbl-ext">
			<asp:ImageButton ID="CmdExit" ToolTip="Exit" AccessKey="X" runat="server" ImageUrl="~/TblImages/can0.png" />
		</div>
		<div class="nt-tbl-new">
			<asp:ImageButton ID="CmdAdd" ToolTip="Add new record" AccessKey="A" runat="server" ImageUrl="~/TblImages/add0.png" />
		</div>
		<div class="nt-tbl-prn">
			<asp:ImageButton ID="CmdPrint" ToolTip="Print data" AccessKey="O" runat="server" ImageUrl="~/TblImages/prt1.png"  OnClientClick="return print_report(this);" Enabled="false" />
		</div>
	</div>
	<div id="tdPage" runat="server" class="nt-row">
		<div class="mnu_but">
			<asp:ImageButton ID="navFirst" ToolTip="First" AccessKey="T" runat="server" ImageUrl="~/TblImages/first0.png" onmouseover="this.src='../../tblimages/first2.png';" onmouseout="this.src='../../tblimages/first0.png';" />
		</div>
		<div class="mnu_but">
			<asp:ImageButton ID="navPrev" ToolTip="Previous" AccessKey="P" runat="server" ImageUrl="~/TblImages/prev0.png" onmouseover="this.src='../../tblimages/prev2.png';" onmouseout="this.src='../../tblimages/prev0.png';" />
		</div>
		<div>
			<asp:TextBox ID="_CurrentPage" runat="server" CssClass="mytxt" MaxLength="5" Width="40px" Text="1" AutoPostBack="True" onfocus = "return this.select();" onblur="return dc(this,0);" />
		</div>
		<div class="mnu_but">
			<asp:Label ID="Label1" runat="server" Text="#of" />
		</div>
		<div class="mnu_but">
			<asp:Label ID="_TotalPages" runat="server" Width="25px" />
		</div>
		<div>
			<asp:Label ID="Label2" runat="server" Text="Pages" />
		</div>
		<div class="mnu_but">
			<asp:ImageButton ID="navNext" ToolTip="Next" AccessKey="N" runat="server" ImageUrl="~/TblImages/next0.png" onmouseover="this.src='../../tblimages/next2.png';" onmouseout="this.src='../../tblimages/next0.png';" />
		</div>
		<div class="mnu_but">
			<asp:ImageButton ID="navLast" ToolTip="Last" AccessKey="L" runat="server" ImageUrl="~/TblImages/last0.png" onmouseover="this.src='../../tblimages/last2.png';" onmouseout="this.src='../../tblimages/last0.png';" />
		</div>
		<div>
			<asp:TextBox ID="_PageSize" runat="server" CssClass="mytxt" MaxLength="5" Width="40px" ValidationGroup="currentpage" onfocus = "return this.select();" onblur="return dc(this,0);" />
		</div>
		<div class="mnu_but">
			<asp:LinkButton ID="_PageSizeButton" runat="server" CausesValidation="False" CommandName="PageSize" Text="/Page">
			</asp:LinkButton>
		</div>
	</div>
	<asp:Panel id="tdSearch" runat="server" class="nt-row" DefaultButton="CmdSearch" >
		<div class="mnu_but">
			<asp:CheckBox ID="DisableSearch" runat="server" Enabled="false" AutoPostBack="true" ToolTip="Uncheck for normal view." />
		</div>
		<div>
			<asp:TextBox ID="SearchTextBox" runat="server" CssClass="mytxt" ToolTip="Enter keywords to search." Width="80px" MaxLength="250" placeholder="[Search]" onfocus="return this.select();" />
		</div>
		<div class="mnu_but">
			<asp:ImageButton ID="CmdSearch" runat="server" ImageUrl="~/TblImages/srh0.png" onmouseover="this.src='../../tblimages/srh2.png';" onmouseout="this.src='../../tblimages/srh0.png';" AlternateText="Search" ToolTip="Click to search" />
		</div>
	</asp:Panel>
</div>
