//
//  StartTimerDialogController.swift
//  MenubarCountdown
//
//  Copyright © 2009,2015,2019 Kristopher Johnson. All rights reserved.

import Cocoa

/**
 Window controller for the "Menubar Countdown Settings" dialog that is used to start the countdown.

 Also see StartTimerDialog.xib.
 */
class StartTimerDialogController: NSWindowController {
    @IBOutlet var startTimerDialog: NSWindow!

    /**
     Load the dialog from the nib.

     The `owner` argument must be an object with a `startTimerDialogController`
     property, which will be set to an instance of this class.
     */
    static func load(owner: NSObject) {
        Bundle.main.loadNibNamed("StartTimerDialog",
            owner: owner,
            topLevelObjects: nil)
    }

    /**
     The total number of seconds represented by the hours:minutes:seconds settings.
     */
    var timerInterval: TimeInterval {
        let defaults = UserDefaults.standard
        let hours = defaults.integer(forKey: AppUserDefaults.timerHoursKey);
        let minutes = defaults.integer(forKey: AppUserDefaults.timerMinutesKey);
        let seconds = defaults.integer(forKey: AppUserDefaults.timerSecondsKey);
        return TimeInterval((hours * 3600) + (minutes * 60) + seconds);
    }

    /**
     Display the dialog and bring it to the front.
     */
    func showDialog() {
        NSApp.activate(ignoringOtherApps: true)
        if !startTimerDialog.isVisible {
            startTimerDialog.center()
            startTimerDialog.makeFirstResponder(nil)
        }
        startTimerDialog.makeKeyAndOrderFront(self)
    }

    /**
     Hide the dialog.
     */
    @IBAction func dismissDialog(_ sender: AnyObject) {
        if !startTimerDialog.makeFirstResponder(nil) {
            // TODO: Figure out what to do if responder didn't resign
        }
        startTimerDialog.orderOut(sender);
    }
}