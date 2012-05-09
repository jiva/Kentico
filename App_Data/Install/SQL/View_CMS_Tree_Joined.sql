CREATE VIEW [View_CMS_Tree_Joined] AS SELECT CASE WHEN (DocumentIsArchived IS NULL OR DocumentIsArchived = 0) AND ((DocumentCheckedOutVersionHistoryID IS NULL AND DocumentPublishedVersionHistoryID IS NULL) OR (DocumentCheckedOutVersionHistoryID IS NOT NULL AND DocumentPublishedVersionHistoryID IS NOT NULL)) AND (DocumentPublishFrom IS NULL OR (DocumentPublishFrom IS NOT NULL AND DocumentPublishFrom <= getdate())) AND (DocumentPublishTo IS NULL OR (DocumentPublishTo IS NOT NULL AND DocumentPublishTo >= getdate())) THEN 1 ELSE 0 END AS Published, CMS_Site.SiteName, CMS_Class.ClassName, CMS_Class.ClassDisplayName, CMS_Tree.[NodeID], CMS_Tree.[NodeAliasPath], CMS_Tree.[NodeName], CMS_Tree.[NodeAlias], CMS_Tree.[NodeClassID], CMS_Tree.[NodeParentID], CMS_Tree.[NodeLevel], CMS_Tree.[NodeACLID], CMS_Tree.[NodeSiteID], CMS_Tree.[NodeGUID], CMS_Tree.[NodeOrder], CMS_Tree.[IsSecuredNode], CMS_Tree.[NodeCacheMinutes], CMS_Tree.[NodeSKUID], CMS_Tree.[NodeDocType], CMS_Tree.[NodeHeadTags], CMS_Tree.[NodeBodyElementAttributes], CMS_Tree.[NodeInheritPageLevels], CMS_Tree.[NodeChildNodesCount], CMS_Tree.[RequiresSSL], CMS_Tree.[NodeLinkedNodeID], CMS_Tree.[NodeOwner], CMS_Tree.[NodeCustomData], CMS_Tree.[NodeGroupID], CMS_Tree.[NodeLinkedNodeSiteID], CMS_Document.[DocumentID], CMS_Document.[DocumentName], CMS_Document.[DocumentNamePath], CMS_Document.[DocumentModifiedWhen], CMS_Document.[DocumentModifiedByUserID], CMS_Document.[DocumentForeignKeyValue], CMS_Document.[DocumentCreatedByUserID], CMS_Document.[DocumentCreatedWhen], CMS_Document.[DocumentCheckedOutByUserID], CMS_Document.[DocumentCheckedOutWhen], CMS_Document.[DocumentCheckedOutVersionHistoryID], CMS_Document.[DocumentPublishedVersionHistoryID], CMS_Document.[DocumentWorkflowStepID], CMS_Document.[DocumentPublishFrom], CMS_Document.[DocumentPublishTo], CMS_Document.[DocumentUrlPath], CMS_Document.[DocumentCulture], CMS_Document.[DocumentNodeID], CMS_Document.[DocumentPageTitle], CMS_Document.[DocumentPageKeyWords], CMS_Document.[DocumentPageDescription], CMS_Document.[DocumentShowInSiteMap], CMS_Document.[DocumentMenuItemHideInNavigation], CMS_Document.[DocumentMenuCaption], CMS_Document.[DocumentMenuStyle], CMS_Document.[DocumentMenuItemImage], CMS_Document.[DocumentMenuItemLeftImage], CMS_Document.[DocumentMenuItemRightImage], CMS_Document.[DocumentPageTemplateID], CMS_Document.[DocumentMenuJavascript], CMS_Document.[DocumentMenuRedirectUrl], CMS_Document.[DocumentUseNamePathForUrlPath], CMS_Document.[DocumentStylesheetID], CMS_Document.[DocumentContent], CMS_Document.[DocumentMenuClass], CMS_Document.[DocumentMenuStyleOver], CMS_Document.[DocumentMenuClassOver], CMS_Document.[DocumentMenuItemImageOver], CMS_Document.[DocumentMenuItemLeftImageOver], CMS_Document.[DocumentMenuItemRightImageOver], CMS_Document.[DocumentMenuStyleHighlighted], CMS_Document.[DocumentMenuClassHighlighted], CMS_Document.[DocumentMenuItemImageHighlighted], CMS_Document.[DocumentMenuItemLeftImageHighlighted], CMS_Document.[DocumentMenuItemRightImageHighlighted], CMS_Document.[DocumentMenuItemInactive], CMS_Document.[DocumentCustomData], CMS_Document.[DocumentExtensions], CMS_Document.[DocumentCampaign], CMS_Document.[DocumentTags], CMS_Document.[DocumentTagGroupID], CMS_Document.[DocumentWildcardRule], CMS_Document.[DocumentWebParts], CMS_Document.[DocumentRatingValue], CMS_Document.[DocumentRatings], CMS_Document.[DocumentPriority], CMS_Document.[DocumentType], CMS_Document.[DocumentLastPublished], CMS_Document.[DocumentUseCustomExtensions], CMS_Document.[DocumentGroupWebParts], CMS_Document.[DocumentCheckedOutAutomatically], CMS_Document.[DocumentTrackConversionName], CMS_Document.[DocumentConversionValue], CMS_Document.[DocumentSearchExcluded], CMS_Document.[DocumentLastVersionName], CMS_Document.[DocumentLastVersionNumber], CMS_Document.[DocumentIsArchived], CMS_Document.[DocumentLastVersionType], CMS_Document.[DocumentLastVersionMenuRedirectUrl], CMS_Document.[DocumentHash], CMS_Document.[DocumentLogVisitActivity], CMS_Document.[DocumentGUID], CMS_Document.[DocumentWorkflowCycleGUID], COM_SKU.[SKUID], COM_SKU.[SKUNumber], COM_SKU.[SKUName], COM_SKU.[SKUDescription], COM_SKU.[SKUPrice], COM_SKU.[SKUEnabled], COM_SKU.[SKUDepartmentID], COM_SKU.[SKUManufacturerID], COM_SKU.[SKUInternalStatusID], COM_SKU.[SKUPublicStatusID], COM_SKU.[SKUSupplierID], COM_SKU.[SKUAvailableInDays], COM_SKU.[SKUGUID], COM_SKU.[SKUImagePath], COM_SKU.[SKUWeight], COM_SKU.[SKUWidth], COM_SKU.[SKUDepth], COM_SKU.[SKUHeight], COM_SKU.[SKUAvailableItems], COM_SKU.[SKUSellOnlyAvailable], COM_SKU.[SKUCustomData], COM_SKU.[SKUOptionCategoryID], COM_SKU.[SKUOrder], COM_SKU.[SKULastModified], COM_SKU.[SKUCreated], COM_SKU.[SKUSiteID], COM_SKU.[SKUPrivateDonation], COM_SKU.[SKUNeedsShipping], COM_SKU.[SKUMaxDownloads], COM_SKU.[SKUValidUntil], COM_SKU.[SKUProductType], COM_SKU.[SKUMaxItemsInOrder], COM_SKU.[SKUMaxPrice], COM_SKU.[SKUValidity], COM_SKU.[SKUValidFor], COM_SKU.[SKUMinPrice], COM_SKU.[SKUMembershipGUID], COM_SKU.[SKUConversionName], COM_SKU.[SKUConversionValue], COM_SKU.[SKUBundleInventoryType], CMS_User.FullName AS NodeOwnerFullName, CMS_User.UserName AS NodeOwnerUserName, CMS_User.Email AS NodeOwnerEmail FROM CMS_Tree WITH (NOLOCK) INNER JOIN CMS_Document WITH (NOLOCK) ON CMS_Tree.NodeID = CMS_Document.DocumentNodeID INNER JOIN CMS_Site WITH (NOLOCK) ON CMS_Tree.NodeSiteID = CMS_Site.SiteID INNER JOIN CMS_Class WITH (NOLOCK) ON CMS_Tree.NodeClassID = CMS_Class.ClassID LEFT OUTER JOIN View_COM_SKU AS COM_SKU WITH (NOLOCK) ON CMS_Tree.NodeSKUID = COM_SKU.SKUID LEFT OUTER JOIN CMS_User WITH (NOLOCK) ON CMS_Tree.NodeOwner = CMS_User.UserID 
UNION ALL
SELECT CASE WHEN (DocumentIsArchived IS NULL OR DocumentIsArchived = 0) AND ((DocumentCheckedOutVersionHistoryID IS NULL AND DocumentPublishedVersionHistoryID IS NULL) OR (DocumentCheckedOutVersionHistoryID IS NOT NULL AND DocumentPublishedVersionHistoryID IS NOT NULL)) AND (DocumentPublishFrom IS NULL OR (DocumentPublishFrom IS NOT NULL AND DocumentPublishFrom <= getdate())) AND (DocumentPublishTo IS NULL OR (DocumentPublishTo IS NOT NULL AND DocumentPublishTo >= getdate())) THEN 1 ELSE 0 END AS Published, CMS_Site.SiteName, CMS_Class.ClassName, CMS_Class.ClassDisplayName, CMS_Tree.[NodeID], CMS_Tree.[NodeAliasPath], CMS_Tree.[NodeName], CMS_Tree.[NodeAlias], CMS_Tree.[NodeClassID], CMS_Tree.[NodeParentID], CMS_Tree.[NodeLevel], CMS_Tree.[NodeACLID], CMS_Tree.[NodeSiteID], CMS_Tree.[NodeGUID], CMS_Tree.[NodeOrder], CMS_Tree.[IsSecuredNode], CMS_Tree.[NodeCacheMinutes], CMS_Tree.[NodeSKUID], CMS_Tree.[NodeDocType], CMS_Tree.[NodeHeadTags], CMS_Tree.[NodeBodyElementAttributes], CMS_Tree.[NodeInheritPageLevels], CMS_Tree.[NodeChildNodesCount], CMS_Tree.[RequiresSSL], CMS_Tree.[NodeLinkedNodeID], CMS_Tree.[NodeOwner], CMS_Tree.[NodeCustomData], CMS_Tree.[NodeGroupID], CMS_Tree.[NodeLinkedNodeSiteID], CMS_Document.[DocumentID], CMS_Document.[DocumentName], CMS_Document.[DocumentNamePath], CMS_Document.[DocumentModifiedWhen], CMS_Document.[DocumentModifiedByUserID], CMS_Document.[DocumentForeignKeyValue], CMS_Document.[DocumentCreatedByUserID], CMS_Document.[DocumentCreatedWhen], CMS_Document.[DocumentCheckedOutByUserID], CMS_Document.[DocumentCheckedOutWhen], CMS_Document.[DocumentCheckedOutVersionHistoryID], CMS_Document.[DocumentPublishedVersionHistoryID], CMS_Document.[DocumentWorkflowStepID], CMS_Document.[DocumentPublishFrom], CMS_Document.[DocumentPublishTo], CMS_Document.[DocumentUrlPath], CMS_Document.[DocumentCulture], CMS_Document.[DocumentNodeID], CMS_Document.[DocumentPageTitle], CMS_Document.[DocumentPageKeyWords], CMS_Document.[DocumentPageDescription], CMS_Document.[DocumentShowInSiteMap], CMS_Document.[DocumentMenuItemHideInNavigation], CMS_Document.[DocumentMenuCaption], CMS_Document.[DocumentMenuStyle], CMS_Document.[DocumentMenuItemImage], CMS_Document.[DocumentMenuItemLeftImage], CMS_Document.[DocumentMenuItemRightImage], CMS_Document.[DocumentPageTemplateID], CMS_Document.[DocumentMenuJavascript], CMS_Document.[DocumentMenuRedirectUrl], CMS_Document.[DocumentUseNamePathForUrlPath], CMS_Document.[DocumentStylesheetID], CMS_Document.[DocumentContent], CMS_Document.[DocumentMenuClass], CMS_Document.[DocumentMenuStyleOver], CMS_Document.[DocumentMenuClassOver], CMS_Document.[DocumentMenuItemImageOver], CMS_Document.[DocumentMenuItemLeftImageOver], CMS_Document.[DocumentMenuItemRightImageOver], CMS_Document.[DocumentMenuStyleHighlighted], CMS_Document.[DocumentMenuClassHighlighted], CMS_Document.[DocumentMenuItemImageHighlighted], CMS_Document.[DocumentMenuItemLeftImageHighlighted], CMS_Document.[DocumentMenuItemRightImageHighlighted], CMS_Document.[DocumentMenuItemInactive], CMS_Document.[DocumentCustomData], CMS_Document.[DocumentExtensions], CMS_Document.[DocumentCampaign], CMS_Document.[DocumentTags], CMS_Document.[DocumentTagGroupID], CMS_Document.[DocumentWildcardRule], CMS_Document.[DocumentWebParts], CMS_Document.[DocumentRatingValue], CMS_Document.[DocumentRatings], CMS_Document.[DocumentPriority], CMS_Document.[DocumentType], CMS_Document.[DocumentLastPublished], CMS_Document.[DocumentUseCustomExtensions], CMS_Document.[DocumentGroupWebParts], CMS_Document.[DocumentCheckedOutAutomatically], CMS_Document.[DocumentTrackConversionName], CMS_Document.[DocumentConversionValue], CMS_Document.[DocumentSearchExcluded], CMS_Document.[DocumentLastVersionName], CMS_Document.[DocumentLastVersionNumber], CMS_Document.[DocumentIsArchived], CMS_Document.[DocumentLastVersionType], CMS_Document.[DocumentLastVersionMenuRedirectUrl], CMS_Document.[DocumentHash], CMS_Document.[DocumentLogVisitActivity], CMS_Document.[DocumentGUID], CMS_Document.[DocumentWorkflowCycleGUID], COM_SKU.[SKUID], COM_SKU.[SKUNumber], COM_SKU.[SKUName], COM_SKU.[SKUDescription], COM_SKU.[SKUPrice], COM_SKU.[SKUEnabled], COM_SKU.[SKUDepartmentID], COM_SKU.[SKUManufacturerID], COM_SKU.[SKUInternalStatusID], COM_SKU.[SKUPublicStatusID], COM_SKU.[SKUSupplierID], COM_SKU.[SKUAvailableInDays], COM_SKU.[SKUGUID], COM_SKU.[SKUImagePath], COM_SKU.[SKUWeight], COM_SKU.[SKUWidth], COM_SKU.[SKUDepth], COM_SKU.[SKUHeight], COM_SKU.[SKUAvailableItems], COM_SKU.[SKUSellOnlyAvailable], COM_SKU.[SKUCustomData], COM_SKU.[SKUOptionCategoryID], COM_SKU.[SKUOrder], COM_SKU.[SKULastModified], COM_SKU.[SKUCreated], COM_SKU.[SKUSiteID], COM_SKU.[SKUPrivateDonation], COM_SKU.[SKUNeedsShipping], COM_SKU.[SKUMaxDownloads], COM_SKU.[SKUValidUntil], COM_SKU.[SKUProductType], COM_SKU.[SKUMaxItemsInOrder], COM_SKU.[SKUMaxPrice], COM_SKU.[SKUValidity], COM_SKU.[SKUValidFor], COM_SKU.[SKUMinPrice], COM_SKU.[SKUMembershipGUID], COM_SKU.[SKUConversionName], COM_SKU.[SKUConversionValue], COM_SKU.[SKUBundleInventoryType], CMS_User.FullName AS NodeOwnerFullName, CMS_User.UserName AS NodeOwnerUserName, CMS_User.Email AS NodeOwnerEmail FROM CMS_Tree WITH (NOLOCK) INNER JOIN CMS_Document WITH (NOLOCK) ON CMS_Tree.NodeLinkedNodeID = CMS_Document.DocumentNodeID INNER JOIN CMS_Site WITH (NOLOCK) ON CMS_Tree.NodeSiteID = CMS_Site.SiteID INNER JOIN CMS_Class WITH (NOLOCK) ON CMS_Tree.NodeClassID = CMS_Class.ClassID LEFT OUTER JOIN View_COM_SKU AS COM_SKU WITH (NOLOCK) ON CMS_Tree.NodeSKUID = COM_SKU.SKUID LEFT OUTER JOIN CMS_User WITH (NOLOCK) ON CMS_Tree.NodeOwner = CMS_User.UserID 
GO