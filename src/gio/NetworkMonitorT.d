/*
 * This file is part of gtkD.
 *
 * gtkD is free software; you can redistribute it and/or modify
 * it under the terms of the GNU Lesser General Public License
 * as published by the Free Software Foundation; either version 3
 * of the License, or (at your option) any later version, with
 * some exceptions, please read the COPYING file.
 *
 * gtkD is distributed in the hope that it will be useful,
 * but WITHOUT ANY WARRANTY; without even the implied warranty of
 * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
 * GNU Lesser General Public License for more details.
 *
 * You should have received a copy of the GNU Lesser General Public License
 * along with gtkD; if not, write to the Free Software
 * Foundation, Inc., 51 Franklin St, Fifth Floor, Boston, MA 02110, USA
 */

// generated automatically - do not change
// find conversion definition on APILookup.txt
// implement new conversion functionalities on the wrap.utils pakage


module gio.NetworkMonitorT;

public  import gio.AsyncResultIF;
public  import gio.Cancellable;
public  import gio.NetworkMonitor;
public  import gio.NetworkMonitorIF;
public  import gio.SocketConnectableIF;
public  import glib.ErrorG;
public  import glib.GException;
public  import gobject.ObjectG;
public  import gobject.Signals;
public  import gtkc.gdktypes;
public  import gtkc.gio;
public  import gtkc.giotypes;


/**
 * #GNetworkMonitor provides an easy-to-use cross-platform API
 * for monitoring network connectivity. On Linux, the implementation
 * is based on the kernel's netlink interface.
 *
 * Since: 2.32
 */
public template NetworkMonitorT(TStruct)
{
	/** Get the main Gtk struct */
	public GNetworkMonitor* getNetworkMonitorStruct()
	{
		return cast(GNetworkMonitor*)getStruct();
	}

	/**
	 */

	/**
	 * Gets the default #GNetworkMonitor for the system.
	 *
	 * Return: a #GNetworkMonitor
	 *
	 * Since: 2.32
	 */
	public static NetworkMonitorIF getDefault()
	{
		auto p = g_network_monitor_get_default();
		
		if(p is null)
		{
			return null;
		}
		
		return ObjectG.getDObject!(NetworkMonitor, NetworkMonitorIF)(cast(GNetworkMonitor*) p);
	}

	/**
	 * Attempts to determine whether or not the host pointed to by
	 * @connectable can be reached, without actually trying to connect to
	 * it.
	 *
	 * This may return %TRUE even when #GNetworkMonitor:network-available
	 * is %FALSE, if, for example, @monitor can determine that
	 * @connectable refers to a host on a local network.
	 *
	 * If @monitor believes that an attempt to connect to @connectable
	 * will succeed, it will return %TRUE. Otherwise, it will return
	 * %FALSE and set @error to an appropriate error (such as
	 * %G_IO_ERROR_HOST_UNREACHABLE).
	 *
	 * Note that although this does not attempt to connect to
	 * @connectable, it may still block for a brief period of time (eg,
	 * trying to do multicast DNS on the local network), so if you do not
	 * want to block, you should use g_network_monitor_can_reach_async().
	 *
	 * Params:
	 *     connectable = a #GSocketConnectable
	 *     cancellable = a #GCancellable, or %NULL
	 *
	 * Return: %TRUE if @connectable is reachable, %FALSE if not.
	 *
	 * Since: 2.32
	 *
	 * Throws: GException on failure.
	 */
	public bool canReach(SocketConnectableIF connectable, Cancellable cancellable)
	{
		GError* err = null;
		
		auto p = g_network_monitor_can_reach(getNetworkMonitorStruct(), (connectable is null) ? null : connectable.getSocketConnectableStruct(), (cancellable is null) ? null : cancellable.getCancellableStruct(), &err) != 0;
		
		if (err !is null)
		{
			throw new GException( new ErrorG(err) );
		}
		
		return p;
	}

	/**
	 * Asynchronously attempts to determine whether or not the host
	 * pointed to by @connectable can be reached, without actually
	 * trying to connect to it.
	 *
	 * For more details, see g_network_monitor_can_reach().
	 *
	 * When the operation is finished, @callback will be called.
	 * You can then call g_network_monitor_can_reach_finish()
	 * to get the result of the operation.
	 *
	 * Params:
	 *     connectable = a #GSocketConnectable
	 *     cancellable = a #GCancellable, or %NULL
	 *     callback = a #GAsyncReadyCallback to call when the
	 *         request is satisfied
	 *     userData = the data to pass to callback function
	 */
	public void canReachAsync(SocketConnectableIF connectable, Cancellable cancellable, GAsyncReadyCallback callback, void* userData)
	{
		g_network_monitor_can_reach_async(getNetworkMonitorStruct(), (connectable is null) ? null : connectable.getSocketConnectableStruct(), (cancellable is null) ? null : cancellable.getCancellableStruct(), callback, userData);
	}

	/**
	 * Finishes an async network connectivity test.
	 * See g_network_monitor_can_reach_async().
	 *
	 * Params:
	 *     result = a #GAsyncResult
	 *
	 * Return: %TRUE if network is reachable, %FALSE if not.
	 *
	 * Throws: GException on failure.
	 */
	public bool canReachFinish(AsyncResultIF result)
	{
		GError* err = null;
		
		auto p = g_network_monitor_can_reach_finish(getNetworkMonitorStruct(), (result is null) ? null : result.getAsyncResultStruct(), &err) != 0;
		
		if (err !is null)
		{
			throw new GException( new ErrorG(err) );
		}
		
		return p;
	}

	/**
	 * Checks if the network is available. "Available" here means that the
	 * system has a default route available for at least one of IPv4 or
	 * IPv6. It does not necessarily imply that the public Internet is
	 * reachable. See #GNetworkMonitor:network-available for more details.
	 *
	 * Return: whether the network is available
	 *
	 * Since: 2.32
	 */
	public bool getNetworkAvailable()
	{
		return g_network_monitor_get_network_available(getNetworkMonitorStruct()) != 0;
	}

	int[string] connectedSignals;

	void delegate(bool, NetworkMonitorIF)[] _onNetworkChangedListeners;
	@property void delegate(bool, NetworkMonitorIF)[] onNetworkChangedListeners()
	{
		return _onNetworkChangedListeners;
	}
	/**
	 * Emitted when the network configuration changes. If @available is
	 * %TRUE, then some hosts may be reachable that were not reachable
	 * before, while others that were reachable before may no longer be
	 * reachable. If @available is %FALSE, then no remote hosts are
	 * reachable.
	 *
	 * Params:
	 *     available = the current value of #GNetworkMonitor:network-available
	 *
	 * Since: 2.32
	 */
	void addOnNetworkChanged(void delegate(bool, NetworkMonitorIF) dlg, ConnectFlags connectFlags=cast(ConnectFlags)0)
	{
		if ( "network-changed" !in connectedSignals )
		{
			Signals.connectData(
				this,
				"network-changed",
				cast(GCallback)&callBackNetworkChanged,
				cast(void*)cast(NetworkMonitorIF)this,
				null,
				connectFlags);
			connectedSignals["network-changed"] = 1;
		}
		_onNetworkChangedListeners ~= dlg;
	}
	extern(C) static void callBackNetworkChanged(GNetworkMonitor* networkmonitorStruct, bool available, NetworkMonitorIF _networkmonitor)
	{
		foreach ( void delegate(bool, NetworkMonitorIF) dlg; _networkmonitor.onNetworkChangedListeners )
		{
			dlg(available, _networkmonitor);
		}
	}
}
