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


module gio.TcpWrapperConnection;

private import gio.IOStream;
private import gio.Socket;
private import gio.SocketConnection;
private import gio.TcpConnection;
private import glib.ConstructionException;
private import gobject.ObjectG;
private import gtkc.gio;
public  import gtkc.giotypes;


/**
 * A #GTcpWrapperConnection can be used to wrap a #GIOStream that is
 * based on a #GSocket, but which is not actually a
 * #GSocketConnection. This is used by #GSocketClient so that it can
 * always return a #GSocketConnection, even when the connection it has
 * actually created is not directly a #GSocketConnection.
 */
public class TcpWrapperConnection : TcpConnection
{
	/** the main Gtk struct */
	protected GTcpWrapperConnection* gTcpWrapperConnection;

	/** Get the main Gtk struct */
	public GTcpWrapperConnection* getTcpWrapperConnectionStruct()
	{
		return gTcpWrapperConnection;
	}

	/** the main Gtk struct as a void* */
	protected override void* getStruct()
	{
		return cast(void*)gTcpWrapperConnection;
	}

	protected override void setStruct(GObject* obj)
	{
		gTcpWrapperConnection = cast(GTcpWrapperConnection*)obj;
		super.setStruct(obj);
	}

	/**
	 * Sets our main struct and passes it to the parent class.
	 */
	public this (GTcpWrapperConnection* gTcpWrapperConnection, bool ownedRef = false)
	{
		this.gTcpWrapperConnection = gTcpWrapperConnection;
		super(cast(GTcpConnection*)gTcpWrapperConnection, ownedRef);
	}

	/**
	 */

	public static GType getType()
	{
		return g_tcp_wrapper_connection_get_type();
	}

	/**
	 * Wraps @base_io_stream and @socket together as a #GSocketConnection.
	 *
	 * Params:
	 *     baseIoStream = the #GIOStream to wrap
	 *     socket = the #GSocket associated with @base_io_stream
	 *
	 * Return: the new #GSocketConnection.
	 *
	 * Since: 2.28
	 *
	 * Throws: ConstructionException GTK+ fails to create the object.
	 */
	public this(IOStream baseIoStream, Socket socket)
	{
		auto p = g_tcp_wrapper_connection_new((baseIoStream is null) ? null : baseIoStream.getIOStreamStruct(), (socket is null) ? null : socket.getSocketStruct());
		
		if(p is null)
		{
			throw new ConstructionException("null returned by new");
		}
		
		this(cast(GTcpWrapperConnection*) p, true);
	}

	/**
	 * Get's @conn's base #GIOStream
	 *
	 * Return: @conn's base #GIOStream
	 */
	public IOStream getBaseIoStream()
	{
		auto p = g_tcp_wrapper_connection_get_base_io_stream(gTcpWrapperConnection);
		
		if(p is null)
		{
			return null;
		}
		
		return ObjectG.getDObject!(IOStream)(cast(GIOStream*) p);
	}
}
