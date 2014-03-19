using System;
using System.IO;
using System.Linq;
using System.Xml.Linq;
using System.Xml.XPath;
using System.Xml;

class Dumper {
	static void Main ()
	{
		var dir = "/Users/kris/Documents/sites/";
		var x = XDocument.Load("mono-sites.xml");
		foreach (var p in x.XPathSelectElements ("/mediawiki/page")){
			var txt = p.XPathSelectElement ("revision/text").Value;
			var rawTitle = p.XPathSelectElement ("title").Value;
			var cleanTitle = rawTitle.Replace (" ", "_");
			var finalTitle = cleanTitle.Replace("/", ":");
			File.WriteAllText (dir + finalTitle, txt);
		}   
	}
}
