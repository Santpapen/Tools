/*
Author: Roland Santiago
Fecha: 23/01/2018
Descripción: Program for download file, same wget

Use:
.Example command line
DownloadFile.exe uri outputname
eg DownloadFile.exe http://www.site.org/img.png logo.png
.Example Double Clip
URL: htpp://www.site.org/img.png
Output Name: logo.png
 */
using System;
using System.IO;
using System.Net;


public class downloadFile
{
    static void Main(string[] args)
    {
        string remoteUri;
        string fileName;
        if (args.Length > 0)
        {
           remoteUri =args[0];
           fileName = args[1];
        }else {
            Console.Write("URL:");
            remoteUri = Console.ReadLine();
            Console.Write("Output Name:");
            fileName = Console.ReadLine();
        } 
        string myStringWebResource = null;
        /* /foreach (Object obj in args){
            Console.WriteLine (obj);
        } /* */
        // create Webclient instance
/* */
        WebClient myWebClient = new WebClient();
            

        // Download File
        myStringWebResource = remoteUri;
        myWebClient.UseDefaultCredentials = true;
        myWebClient.Credentials = CredentialCache.DefaultCredentials;
        myWebClient.DownloadFile(myStringWebResource,fileName);
/* */

    } // End Main
} // End Class