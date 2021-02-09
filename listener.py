# method call time=1612879746.349075 sender=:1.6 -> destination=org.freedesktop.Notifications serial=11 path=/org/freedesktop/Notifications; interface=org.freedesktop.Notifications; member=Notify
import dbus
from gi.repository import GLib

from dbus.mainloop.glib import DBusGMainLoop

def notifications(bus, message):
    print([arg for arg in message.get_args_list()])

DBusGMainLoop(set_as_default=True)

bus = dbus.SessionBus()
bus.add_match_string_non_blocking("eavesdrop=true, interface='org.freedesktop.Notifications', member='Notify'")
bus.add_message_filter(notifications)

mainloop = GLib.MainLoop()
mainloop.run()
