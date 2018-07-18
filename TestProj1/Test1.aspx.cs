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
    public partial class Test1 : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
           
           // GetProjects();
        }



        //public static async void GetProjects()
        //{
        //    try
        //    {
        //        var personalaccesstoken = "volyluf6yza43rhvlb6bkjcfdoe535lyn3k43mqpmqyq2agwwdva";

        //        using (HttpClient client = new HttpClient())
        //        {
        //            client.DefaultRequestHeaders.Accept.Add(
        //                new System.Net.Http.Headers.MediaTypeWithQualityHeaderValue("application/json"));

        //            client.DefaultRequestHeaders.Authorization = new AuthenticationHeaderValue("Basic",
        //                Convert.ToBase64String(
        //                    System.Text.ASCIIEncoding.ASCII.GetBytes(
        //                        string.Format("{0}:{1}", "", personalaccesstoken))));

        //            using (HttpResponseMessage response = await client.GetAsync(
        //                        "https://civicaiq.visualstudio.com/DefaultCollection/_apis/projects"))
        //            {
        //                response.EnsureSuccessStatusCode();
        //                string responseBody = await response.Content.ReadAsStringAsync();
        //                Console.WriteLine(responseBody);
        //            }
        //        }
        //    }
        //    catch (Exception ex)
        //    {
        //        Console.WriteLine(ex.ToString());
        //    }
        //}

    }



}