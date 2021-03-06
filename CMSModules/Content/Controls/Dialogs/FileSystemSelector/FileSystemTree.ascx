<%@ Control Language="C#" AutoEventWireup="true" Inherits="CMSModules_Content_Controls_Dialogs_FileSystemSelector_FileSystemTree"
    CodeFile="FileSystemTree.ascx.cs" %>
<asp:Label runat="server" ID="lblError"></asp:Label>
<asp:Panel runat="server" ID="pnlTree">
    <cms:uitreeview id="treeFileSystem" shortid="t" runat="server" ontreenodepopulate="treeFileSystem_TreeNodePopulate"
        cssclass="ContentTree" style="padding-top: 5px; padding-left: 5px" />
</asp:Panel>
<asp:Literal runat="server" ID="ltlScript" EnableViewState="false" />
