using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Threading.Tasks;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Speech.Recognition;
using System.Speech.Synthesis;
using System.Threading;

namespace TestProj1
{
    public partial class Default : System.Web.UI.Page
    {


        protected void Listen_Click(object sender, EventArgs e)
        {
            SpeechRecognitionEngine recognizer1;

            SpeechSynthesizer ss1 = new SpeechSynthesizer();
            ss1.Rate = 1;
            ss1.Volume = 100;
            ss1.SelectVoice(ss1.GetInstalledVoices()[1].VoiceInfo.Name);
            //ss1.Speak("fsdfdfd");
            ss1.Speak(notetextarea.InnerText);

        }
        protected void Page_Load(object sender, EventArgs e)
        {
           


            //      var selectedRecognizer = (from a in SpeechRecognitionEngine.InstalledRecognizers()
            //                                //where a.Culture.Equals(Thread.CurrentThread.CurrentCulture)
            //                                select a).FirstOrDefault();
            //      recognizer1 = new SpeechRecognitionEngine(selectedRecognizer);
            //      recognizer1.SpeechRecognized += new EventHandler<SpeechRecognizedEventArgs>(recognizer_SpeechRecognized);
            //      //synthesizer = new SpeechSynthesizer();


            //      using (
            //SpeechRecognitionEngine recognizer =
            //  new SpeechRecognitionEngine(
            //    new System.Globalization.CultureInfo("en-IN")))
            //      {

            //          Grammar dictationGrammar = new DictationGrammar();
            //          recognizer.LoadGrammar(dictationGrammar);
            //          try
            //          {
            //              recognizer.SetInputToDefaultAudioDevice();

            //              RecognitionResult result = recognizer.Recognize();

            //          }
            //          catch (InvalidOperationException exception)
            //          {

            //          }
            //          finally
            //          {
            //              recognizer.UnloadAllGrammars();
            //          }
            //      }











            //      FileSystemWatcher ss = new FileSystemWatcher(@"C:\\todelete");
            //      ss.Changed += Ss_Changed;
            //      ss.EnableRaisingEvents = true;


            //      DateTime startDate = DateTime.Now;
            //      DateTime endDate = DateTime.Now;

            //      startDate = DateTime.Now;

            //      List<string> toPreocess = new List<string>();


            //      for (int i = 0; i < 1000; i++)
            //      {
            //          toPreocess.Add(i.ToString());
            //      }          

            //      Parallel.ForEach<string>(toPreocess, (i => GenerateFile(i)));
            //      endDate = DateTime.Now;

            //      Response.Write(Environment.NewLine);
            //      Response.Write("\n");
            //      Response.Write("<br/>");
            //      Response.Write("With Threading : " + (endDate - startDate).TotalMilliseconds);
            //      Response.Write("<br/>");


            //      startDate = DateTime.Now;
            //      foreach (var item in toPreocess)
            //      {
            //          GenerateFile(item.ToString());
            //      }

            //      endDate = DateTime.Now;
            //      Response.Write(Environment.NewLine);
            //      Response.Write("\n");
            //      Response.Write("<br/>");
            //      Response.Write("<br/>");
            //      Response.Write("Without Threading : " + (endDate - startDate).TotalMilliseconds);

        }

        private void recognizer_SpeechRecognized(object sender, SpeechRecognizedEventArgs e)
        {
            float accuracy = (float)e.Result.Confidence;
            string phrase = e.Result.Text;
            {
                if (phrase == "End Dictate")
                {
                    return;
                }
            }
        }

        private void Ss_Changed(object sender, FileSystemEventArgs e)
        {
            string str = e.FullPath;
        }

        public void GenerateFile(string id)
        {
            if (!Directory.Exists(@"C:\ToDelete"))
            {
                Directory.CreateDirectory(@"C:\ToDelete");
            }
            string fileName = "DKC_" + id.ToString() + ".txt";
            using (StreamWriter sw = new StreamWriter(@"C:\ToDelete\" + fileName))
            {
                for (int i = 0; i < 50; i++)
                {
                    sw.WriteLine(i.ToString());
                    sw.WriteLine(Environment.NewLine);
                }
            }
        }
    }
}