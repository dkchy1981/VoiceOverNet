using System;
using System.Web;
using System.Web.UI;

using Microsoft.TeamFoundation.WorkItemTracking.WebApi;
using Microsoft.TeamFoundation.WorkItemTracking.WebApi.Models;

using Microsoft.VisualStudio.Services.Client;
using Microsoft.TeamFoundation.Client;
using Microsoft.VisualStudio.Services.Common;
using Microsoft.VisualStudio.Services.WebApi.Patch.Json;
using Microsoft.VisualStudio.Services.WebApi;
using Microsoft.VisualStudio.Services.WebApi.Patch;
using System.Web.Services;

namespace TestProj1
{
    public partial class TFSOnline : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }


        [WebMethod]
        public static void Process(string Title)
        {
            CreateBug cc = new CreateBug();
            cc.CreateBugUsingClientLib(Title);
        }

    }



    public class CreateBug
    {
        readonly string _uri;
        readonly string _personalAccessToken;
        readonly string _project;

        /// <summary>
        /// Constructor. Manually set values to match your account.
        /// </summary>
        public CreateBug()
        {
            _uri = "https://civicaiq.visualstudio.com";
            _personalAccessToken = "volyluf6yza43rhvlb6bkjcfdoe535lyn3k43mqpmqyq2agwwdva";
            _project = "MyFirstProject";
        }

        /// <summary>
        /// Create a bug using the .NET client library
        /// </summary>
        /// <returns>Microsoft.TeamFoundation.WorkItemTracking.WebApi.Models.WorkItem</returns>    
        public WorkItem CreateBugUsingClientLib(string subject)
        {
            Uri uri = new Uri(_uri);
            string personalAccessToken = _personalAccessToken;
            string project = _project;

            VssBasicCredential credentials = new VssBasicCredential("", _personalAccessToken);
            JsonPatchDocument patchDocument = new JsonPatchDocument();

            //add fields and their values to your patch document
            patchDocument.Add(
                new JsonPatchOperation()
                {
                    Operation = Operation.Add,
                    Path = "/fields/System.Title",
                    Value = subject
                }
            );

            patchDocument.Add(
                new JsonPatchOperation()
                {
                    Operation = Operation.Add,
                    Path = "/fields/Microsoft.VSTS.TCM.ReproSteps",
                    Value = "Our authorization logic needs to allow for users with Microsoft accounts (formerly Live Ids) - http:// msdn.microsoft.com/en-us/library/live/hh826547.aspx"
                }
            );

            patchDocument.Add(
                new JsonPatchOperation()
                {
                    Operation = Operation.Add,
                    Path = "/fields/Microsoft.VSTS.Common.Priority",
                    Value = "1"
                }
            );

            patchDocument.Add(
                new JsonPatchOperation()
                {
                    Operation = Operation.Add,
                    Path = "/fields/Microsoft.VSTS.Common.Severity",
                    Value = "2 - High"
                }
            );
            VssConnection connection = new VssConnection(uri, credentials);
            WorkItemTrackingHttpClient workItemTrackingHttpClient = connection.GetClient<WorkItemTrackingHttpClient>();

            try
            {
                WorkItem result = workItemTrackingHttpClient.CreateWorkItemAsync(patchDocument, project, "Task").Result;

                Console.WriteLine("Bug Successfully Created: Bug #{0}", result.Id);

                return result;
            }
            catch (AggregateException ex)
            {
                Console.WriteLine("Error creating bug: {0}", ex.InnerException.Message);
                return null;
            }
        }
    }


    public class WorkItemLocal
    {
        public string Title { get; set; }
    }
}