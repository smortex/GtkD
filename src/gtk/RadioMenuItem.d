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


module gtk.RadioMenuItem;

private import glib.ConstructionException;
private import glib.ListSG;
private import glib.Str;
private import gobject.ObjectG;
private import gobject.Signals;
private import gtk.CheckMenuItem;
private import gtk.Widget;
public  import gtkc.gdktypes;
private import gtkc.gtk;
public  import gtkc.gtktypes;


/**
 * A radio menu item is a check menu item that belongs to a group. At each
 * instant exactly one of the radio menu items from a group is selected.
 * 
 * The group list does not need to be freed, as each #GtkRadioMenuItem will
 * remove itself and its list item when it is destroyed.
 * 
 * The correct way to create a group of radio menu items is approximatively
 * this:
 * 
 * ## How to create a group of radio menu items.
 * 
 * |[<!-- language="C" -->
 * GSList *group = NULL;
 * GtkWidget *item;
 * gint i;
 * 
 * for (i = 0; i < 5; i++)
 * {
 * item = gtk_radio_menu_item_new_with_label (group, "This is an example");
 * group = gtk_radio_menu_item_get_group (GTK_RADIO_MENU_ITEM (item));
 * if (i == 1)
 * gtk_check_menu_item_set_active (GTK_CHECK_MENU_ITEM (item), TRUE);
 * }
 * ]|
 */
public class RadioMenuItem : CheckMenuItem
{
	/** the main Gtk struct */
	protected GtkRadioMenuItem* gtkRadioMenuItem;

	/** Get the main Gtk struct */
	public GtkRadioMenuItem* getRadioMenuItemStruct()
	{
		return gtkRadioMenuItem;
	}

	/** the main Gtk struct as a void* */
	protected override void* getStruct()
	{
		return cast(void*)gtkRadioMenuItem;
	}

	protected override void setStruct(GObject* obj)
	{
		gtkRadioMenuItem = cast(GtkRadioMenuItem*)obj;
		super.setStruct(obj);
	}

	/**
	 * Sets our main struct and passes it to the parent class.
	 */
	public this (GtkRadioMenuItem* gtkRadioMenuItem, bool ownedRef = false)
	{
		this.gtkRadioMenuItem = gtkRadioMenuItem;
		super(cast(GtkCheckMenuItem*)gtkRadioMenuItem, ownedRef);
	}

	/**
	 * Creates a new GtkRadioMenuItem whose child is a simple GtkLabel.
	 * The new GtkRadioMenuItem is added to the same group as group.
	 * If mnemonic is true the label will be
	 * created using gtk_label_new_with_mnemonic(), so underscores in label
	 * indicate the mnemonic for the menu item.
	 * Since 2.4
	 * Params:
	 *  group = an existing GtkRadioMenuItem
	 *  label = the text for the label
	 * Throws: ConstructionException GTK+ fails to create the object.
	 */
	public this (RadioMenuItem radioMenuItem, string label, bool mnemonic=true)
	{
		GtkRadioMenuItem* p;
		
		if ( mnemonic )
		{
			// GtkWidget* gtk_radio_menu_item_new_with_mnemonic_from_widget  (GtkRadioMenuItem *group,  const gchar *label);
			p = cast(GtkRadioMenuItem*)gtk_radio_menu_item_new_with_mnemonic_from_widget(
			radioMenuItem.getRadioMenuItemStruct(), Str.toStringz(label));
		}
		else
		{
			// GtkWidget* gtk_radio_menu_item_new_with_label_from_widget  (GtkRadioMenuItem *group,  const gchar *label);
			p = cast(GtkRadioMenuItem*)gtk_radio_menu_item_new_with_label_from_widget(
			radioMenuItem.getRadioMenuItemStruct(), Str.toStringz(label));
		}
		
		if(p is null)
		{
			throw new ConstructionException("null returned by gtk_radio_menu_item_new_with_");
		}
		
		this(p);
	}
	
	/**
	 * Creates a new GtkRadioMenuItem whose child is a simple GtkLabel.
	 * Params:
	 *  group = the group to which the radio menu item is to be attached
	 *  label = the text for the label
	 *  mnemonic = if true the label
	 *  will be created using gtk_label_new_with_mnemonic(), so underscores
	 *  in label indicate the mnemonic for the menu item.
	 * Throws: ConstructionException GTK+ fails to create the object.
	 */
	public this (ListSG group, string label, bool mnemonic=true)
	{
		GtkRadioMenuItem* p;
		
		if ( mnemonic )
		{
			// GtkWidget* gtk_radio_menu_item_new_with_mnemonic  (GSList *group,  const gchar *label);
			p = cast(GtkRadioMenuItem*)gtk_radio_menu_item_new_with_mnemonic(
			group is null ? null : group.getListSGStruct(), Str.toStringz(label));
		}
		else
		{
			// GtkWidget* gtk_radio_menu_item_new_with_label  (GSList *group,  const gchar *label);
			p = cast(GtkRadioMenuItem*)gtk_radio_menu_item_new_with_label(
			group is null ? null : group.getListSGStruct(), Str.toStringz(label));
		}
		
		if(p is null)
		{
			throw new ConstructionException("null returned by gtk_radio_menu_item_new_with_");
		}
		
		this(p);
	}

	/**
	 */

	public static GType getType()
	{
		return gtk_radio_menu_item_get_type();
	}

	/**
	 * Creates a new #GtkRadioMenuItem.
	 *
	 * Params:
	 *     group = the group to which the
	 *         radio menu item is to be attached, or %NULL
	 *
	 * Return: a new #GtkRadioMenuItem
	 *
	 * Throws: ConstructionException GTK+ fails to create the object.
	 */
	public this(ListSG group)
	{
		auto p = gtk_radio_menu_item_new((group is null) ? null : group.getListSGStruct());
		
		if(p is null)
		{
			throw new ConstructionException("null returned by new");
		}
		
		this(cast(GtkRadioMenuItem*) p);
	}

	/**
	 * Creates a new #GtkRadioMenuItem adding it to the same group as @group.
	 *
	 * Params:
	 *     group = An existing #GtkRadioMenuItem
	 *
	 * Return: The new #GtkRadioMenuItem
	 *
	 * Since: 2.4
	 *
	 * Throws: ConstructionException GTK+ fails to create the object.
	 */
	public this(RadioMenuItem group)
	{
		auto p = gtk_radio_menu_item_new_from_widget((group is null) ? null : group.getRadioMenuItemStruct());
		
		if(p is null)
		{
			throw new ConstructionException("null returned by new_from_widget");
		}
		
		this(cast(GtkRadioMenuItem*) p);
	}

	/**
	 * Returns the group to which the radio menu item belongs, as a #GList of
	 * #GtkRadioMenuItem. The list belongs to GTK+ and should not be freed.
	 *
	 * Return: the group
	 *     of @radio_menu_item
	 */
	public ListSG getGroup()
	{
		auto p = gtk_radio_menu_item_get_group(gtkRadioMenuItem);
		
		if(p is null)
		{
			return null;
		}
		
		return new ListSG(cast(GSList*) p);
	}

	/**
	 * Sets the group of a radio menu item, or changes it.
	 *
	 * Params:
	 *     group = the new group, or %NULL.
	 */
	public void setGroup(ListSG group)
	{
		gtk_radio_menu_item_set_group(gtkRadioMenuItem, (group is null) ? null : group.getListSGStruct());
	}

	int[string] connectedSignals;

	void delegate(RadioMenuItem)[] onGroupChangedListeners;
	void addOnGroupChanged(void delegate(RadioMenuItem) dlg, ConnectFlags connectFlags=cast(ConnectFlags)0)
	{
		if ( "group-changed" !in connectedSignals )
		{
			Signals.connectData(
				this,
				"group-changed",
				cast(GCallback)&callBackGroupChanged,
				cast(void*)this,
				null,
				connectFlags);
			connectedSignals["group-changed"] = 1;
		}
		onGroupChangedListeners ~= dlg;
	}
	extern(C) static void callBackGroupChanged(GtkRadioMenuItem* radiomenuitemStruct, RadioMenuItem _radiomenuitem)
	{
		foreach ( void delegate(RadioMenuItem) dlg; _radiomenuitem.onGroupChangedListeners )
		{
			dlg(_radiomenuitem);
		}
	}
}
