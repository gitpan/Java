#!/home/markt/bin/perl -w

use strict;
no strict 'subs';
use Java;

my $awt = "java.awt";
my $swing = "javax.swing";

#my $java = new Java();
my $java = new Java(host=>"sooto.redback.com");

# Create the window
my $frame = $java->create_object("$swing.JFrame","Menu Demo");
my $panel = $java->create_object("$swing.JPanel");

$frame->getContentPane->add($panel,"Center");

#// Menus

#// File Menu
my $file_menu = $java->create_object("$swing.JMenu","File");
$file_menu->setMnemonic("F:char");
$file_menu->add(&menu_item("New",\&menu_handler,"new",'N',$java->get_field("java.awt.event.KeyEvent","VK_N")));
$file_menu->add(&menu_item("Open...",\&menu_handler,"open",'O',$java->get_field("java.awt.event.KeyEvent","VK_O")));
$file_menu->add(&menu_item("Save",\&menu_handler,"save",'S',$java->get_field("java.awt.event.KeyEvent","VK_S")));
$file_menu->add(&menu_item("Save As...",\&menu_handler,"savea",'A',$java->get_field("java.awt.event.KeyEvent","VK_A")));

# Edit Menu
my $edit_menu = $java->create_object("$swing.JMenu","Edit");
$edit_menu->setMnemonic("E:char");
$edit_menu->add(&menu_item("Cut",\&menu_handler,"cut",0,$java->get_field("java.awt.event.KeyEvent","VK_X")));
$edit_menu->add(&menu_item("Copy",\&menu_handler,"copy",'C',$java->get_field("java.awt.event.KeyEvent","VK_C")));
$edit_menu->add(&menu_item("Paste",\&menu_handler,"paste",0,$java->get_field("java.awt.event.KeyEvent","VK_V")));

my $t_menu = $java->create_object("$swing.JMenu","Click in window for popup menu!");

# Menu bar
my $menu_bar = $java->create_object("$swing.JMenuBar");
$menu_bar->add($file_menu);
$menu_bar->add($edit_menu);
$menu_bar->add($t_menu);

$frame->setJMenuBar($menu_bar);

# Going for popup menu

my $popup = $java->create_object("$swing.JPopupMenu");
$popup->add(&menu_item("Open...",\&menu_handler,"open",0,0));
$popup->addSeparator;

my $colors = $java->create_object("$swing.JMenu","Colors");
$popup->add($colors);

my $color_group = $java->create_object("$swing.ButtonGroup");
$colors->add(&radio_item("Red",\&menu_handler,"color(red)",$color_group));
$colors->add(&radio_item("Green",\&menu_handler,"color(green)",$color_group));
$colors->add(&radio_item("Blue",\&menu_handler,"color(blue)",$color_group));

#// Now have it show up when user clicks in the window...
$java->do_event($panel,"addMouseListener",\&mouse_handler);

$frame->setSize(450,300);
$frame->setVisible("true:b");
$frame->show;

my $cont = 1;
while($cont)
{
	$java->go;
}

#// Convenience function to create a JMenuItem
sub menu_item
{
	my($label, $callback, $command, $mnemonic, $accelerator_key) = @_;

	my $jmenu_item = $java->create_object("$swing.JMenuItem",$label);
	$java->do_event($jmenu_item, "addActionListener", $callback);
	$jmenu_item->setActionCommand($command);
	if ($mnemonic)
	{
		$jmenu_item->setMnemonic("$mnemonic:char");
	}
	if ($accelerator_key)
	{
		my $mask = $java->get_field("java.awt.Event","CTRL_MASK");
		my $key_stroke = $java->javax_swing_KeyStroke("getKeyStroke",$accelerator_key->get_value,$mask);
		$jmenu_item->setAccelerator($key_stroke);
	}

	return $jmenu_item;
}

# convenience radio item function
sub radio_item
{
	my($label, $callback, $command, $mutExGroup) = @_;
	my $jmenu_item = $java->create_object("$swing.JMenuItem",$label);
	$java->do_event($jmenu_item, "addActionListener", $callback);
	$jmenu_item->setActionCommand($command);
	$mutExGroup->add($jmenu_item);
	return $jmenu_item;
}
	

sub menu_handler
{
	my($object,$event) = @_;

	my $cmd = $object->getActionCommand->get_value;
	$java->javax_swing_JOptionPane("showMessageDialog",$frame,"$cmd was selected.");
}

sub mouse_handler
{
	my($object,$event) = @_;

	my $mp = $java->get_field("$awt.event.MouseEvent","MOUSE_PRESSED")->get_value;
	my $id = $event->getID->get_value;
	
	#// A MousePressed Event...
	if ($mp == $id)
	{
# This works on every other platform but Windows!  Ridickerous.
		if ($event->isPopupTrigger->get_value eq "true")
		{
			$popup->show($object,$event->getX->get_value,$event->getY->get_value);
		}
	}
}
