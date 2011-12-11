// -*- Mode: vala; indent-tabs-mode: nil; tab-width: 4 -*-
/***
  BEGIN LICENSE

  Copyright (C) 2011 David Gomes <davidrafagomes@gmail.com>
  This program is free software: you can redistribute it and/or modify it
  under the terms of the GNU Lesser General Public License version 3, as published
  by the Free Software Foundation.

  This program is distributed in the hope that it will be useful, but
  WITHOUT ANY WARRANTY; without even the implied warranties of
  MERCHANTABILITY, SATISFACTORY QUALITY, or FITNESS FOR A PARTICULAR
  PURPOSE.  See the GNU General Public License for more details.

  You should have received a copy of the GNU General Public License along
  with this program.  If not, see <http://www.gnu.org/licenses/>

  END LICENSE
***/

using Gtk;
using Granite.Widgets;

namespace PantheonTerminal {

    public class Preferences : Dialog {

        private PantheonTerminalWindow parent_window;

        public StaticNotebook main_static_notebook;

        public Preferences (string? title, PantheonTerminalWindow window) {

            this.parent_window = window;
            this.title = title;
            this.type_hint = Gdk.WindowTypeHint.DIALOG;
            this.set_transient_for (parent_window);
            this.resizable = false;
            set_default_size (550, 250);

            main_static_notebook = new StaticNotebook ();

            create_layout ();

        }

        private void create_layout () {

            // TODO Finish Preferences Dialog
            var general = new Label (_("General"));
            main_static_notebook.append_page (get_general_box (), general);        
            
            var second = new Label (_("Second (?)"));
            main_static_notebook.append_page (get_second_box (), second);    
            
            ((Gtk.Box)get_content_area()).add (main_static_notebook);
            
        }

        Gtk.Widget get_general_box () {
            
            var opacity = new Switch ();
            settings.schema.bind ("opacity", opacity, "active", SettingsBindFlags.DEFAULT);
            
            var general_grid = new Gtk.Grid ();
            general_grid.row_spacing = 5;
            general_grid.column_spacing = 5;
            general_grid.margin_left = 12;
            general_grid.margin_right = 12;
            general_grid.margin_top = 12;
            general_grid.margin_bottom = 12;
            
            int row = 0;
            var label = new Label (_("Opacity"));
            add_option (general_grid, label, opacity, ref row);
            
            return general_grid;
        }
        
        Gtk.Widget get_second_box () {
            
            var show_toolbar = new Switch ();
            settings.schema.bind ("show-toolbar", show_toolbar, "active", SettingsBindFlags.DEFAULT);
            
            var general_grid = new Gtk.Grid ();
            general_grid.row_spacing = 5;
            general_grid.column_spacing = 5;
            general_grid.margin_left = 12;
            general_grid.margin_right = 12;
            general_grid.margin_top = 12;
            general_grid.margin_bottom = 12;
            
            int row = 0;
            var label = new Label (_("Show toolbar"));
            add_option (general_grid, label, show_toolbar, ref row);
            
            return general_grid;
            
        }
        
        void add_option (Gtk.Grid grid, Gtk.Widget label, Gtk.Widget switcher, ref int row) {
            label.hexpand = true;
            label.halign = Gtk.Align.START;
            switcher.halign = Gtk.Align.END;
            grid.attach (label, 0, row, 1, 1);
            grid.attach_next_to (switcher, label, Gtk.PositionType.RIGHT, 1, 1);
            row ++;
        }

    }

} // Namespace
