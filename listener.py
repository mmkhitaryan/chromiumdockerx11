import dbus
import requests
from gi.repository import GLib
import threading

from dbus.mainloop.glib import DBusGMainLoop

def send_req(push_title, push_body):
    requests.post('https://webhook.site/e7423247-ad55-49b6-bbef-3b054b4be8bb', data={'push_title':push_title,'push_body':push_body})

def notifications(bus, message):
    args = [str(arg) for arg in message.get_args_list()]

    # dbus.String('Web Push Book'), dbus.String('<a href="https://web-push-book.gauntface.com/">web-push-book.gauntface.com</a>\n\nThis would be the body text of the notification.\nIt can hold two lines of text.'), dbus.Array([dbus.String('0'), dbus.String('Download Book')
    push_title = args[3]
    push_body = args[4]

    threading.Thread(target=send_req, args=(push_title, push_body)).start()
    print(args)

DBusGMainLoop(set_as_default=True)

bus = dbus.SessionBus()
bus.add_match_string_non_blocking("eavesdrop=true, interface='org.freedesktop.Notifications', member='Notify'")
bus.add_message_filter(notifications)

mainloop = GLib.MainLoop()
mainloop.run()
