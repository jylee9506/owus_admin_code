(function(d, m){
    var kommunicateSettings =
        {
            "appId":"2fede9011e390ab0dae39795757a7b196",
            "popupWidget":true,
            "automaticChatOpenOnNavigation":true,
            ...localization
        };
    kommunicateSettings.restartConversationByUser = true;

    var s = document.createElement("script"); s.type = "text/javascript"; s.async = true;
    s.src = "https://widget.kommunicate.io/v2/kommunicate.app";
    var h = document.getElementsByTagName("head")[0]; h.appendChild(s);
    window.kommunicate = m; m._globals = kommunicateSettings;
})(document, window.kommunicate || {});