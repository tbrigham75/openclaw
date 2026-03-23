# Access Webgui
Without setting up a proxy and SSL cert this is how to access the WebGUI

1. openclaw dashboard

2.  Will actually tell you how:
    Dashboard URL: http://127.0.0.1:18789/#token=somekindoftoken
    Copy to clipboard unavailable.
    No GUI detected. Open from your computer:
    ssh -N -L 18789:127.0.0.1:18789 tom@192.168.0.5
    Then open:
    http://localhost:18789/
    http://localhost:18789/#token=somekindoftoken
    Docs:
    https://docs.openclaw.ai/gateway/remote
    https://docs.openclaw.ai/web/control-ui