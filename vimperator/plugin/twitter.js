// Vimperator plugin: "Update Twitter"
// Last Change: 21-Jan-2009. Jan 2008
// License: Creative Commons
// Maintainer: Trapezoid <trapezoid.g@gmail.com> - http://unsigned.g.hatena.ne.jp/Trapezoid
//
// The script allows you to update Twitter status from Vimperator 0.6.*.
//
// Commands:
//  :twitter some thing text
//      post "some thing text" to twitter.
//  :twitter! someone
//      show someone's statuses.
//  :twitter!? someword
//      show search result of 'someword' from "http://search.twitter.com/".
//  :twitter!@
//      show replies.
//  :twitter!+ someone
//      fav someone's last status..
//  :twitter!- someone
//      un-fav someone's last status..

(function(){
    var passwordManager = Cc["@mozilla.org/login-manager;1"].getService(Ci.nsILoginManager);
    var evalFunc = window.eval;
    try {
        var sandbox = new Components.utils.Sandbox(window);
        if (Components.utils.evalInSandbox("true", sandbox) === true) {
            evalFunc = function(text) {
                return Components.utils.evalInSandbox(text, sandbox);
            }
        }
    } catch(e) { liberator.log('warning: twitter.js is working with unsafe sandbox.'); }

    function sprintf(format){
        var i = 1, re = /%s/, result = "" + format;
        while (re.test(result) && i < arguments.length) result = result.replace(re, arguments[i++]);
        return result;
    }
    function getElementsByXPath(xpath, node){
        node = node || document;
        var nodesSnapshot = (node.ownerDocument || node).evaluate(xpath, node, null,
                XPathResult.ORDERED_NODE_SNAPSHOT_TYPE, null);
        var data = [];
        for(var i = 0, l = nodesSnapshot.snapshotLength; i < l;
                data.push(nodesSnapshot.snapshotItem(i++)));
        return (data.length > 0) ? data : null;
    }
    function getFirstElementByXPath(xpath, node){
        node = node || document;
        var doc = node.ownerDocument;
        var result = (node.ownerDocument || node).evaluate(xpath, node, null,
                XPathResult.FIRST_ORDERED_NODE_TYPE, null);
        return result.singleNodeValue ? result.singleNodeValue : null;
    }
    function sayTwitter(username, password, stat){
        var xhr = new XMLHttpRequest();
        xhr.open("POST", "http://twitter.com/statuses/update.json", false, username, password);
        xhr.setRequestHeader("Content-Type", "application/x-www-form-urlencoded");
        xhr.send("status=" + encodeURIComponent(stat) + "&source=Vimperator");
        liberator.echo("[Twitter] Your post " + '"' + stat + '" (' + stat.length + " characters) was sent. " );
    }
    liberator.modules.commands.addUserCommand(["twitter"], "Change Twitter status",
        function(arg, special){
            var password;
            var username;
            try {
                var logins = passwordManager.findLogins({}, "http://twitter.com", "https://twitter.com", null);
                if (logins.length)
                    [username, password] = [logins[0].username, logins[0].password];
                else
                    throw "Twitter: account not found";
            }
            catch (ex){
                liberator.echoerr(ex);
            }

            arg = arg.string.replace(/%URL%/g, liberator.modules.buffer.URL)
                .replace(/%TITLE%/g, liberator.modules.buffer.title);

            sayTwitter(username, password, arg);
        },{
            bang: true,
            literal: 0
        }
    );
})();
// vim:sw=4 ts=4 et:
