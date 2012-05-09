using System;
using System.Data;
using System.Configuration;
using System.Collections;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.UI.WebControls.WebParts;
using System.Web.UI.HtmlControls;

using CMS.GlobalHelper;
using CMS.CMSImportExport;

public partial class CMSModules_ImportExport_Controls_Import_Site_forums_forum : ImportExportControl
{
    /// <summary>
    /// True if import into existing site.
    /// </summary>
    protected bool ExistingSite
    {
        get
        {
            if (Settings != null)
            {
                return ((SiteImportSettings)Settings).ExistingSite;
            }
            return true;
        }
    }


    /// <summary>
    /// True if the data should be imported.
    /// </summary>
    protected bool Import
    {
        get
        {
            if (ExistingSite)
            {
                return false;
            }
            return this.chkObject.Checked;
        }
    }


    protected void Page_Load(object sender, EventArgs e)
    {
         this.Visible = !ExistingSite;

         if (!ExistingSite)
         {
             this.chkObject.Visible = true;
             this.chkObject.Text = GetString("CMSImport_Forum.ImportForum");
         }
    }


    /// <summary>
    /// Gets settings.
    /// </summary>
    public override void SaveSettings()
    {
        Settings.SetSettings(ImportExportHelper.SETTINGS_FORUM_POSTS, Import);
    }


    /// <summary>
    /// Reload data.
    /// </summary>
    public override void ReloadData()
    {
        if (!ExistingSite)
        {
            this.chkObject.Checked = ValidationHelper.GetBoolean(Settings.GetSettings(ImportExportHelper.SETTINGS_FORUM_POSTS), true);
        }
    }
}