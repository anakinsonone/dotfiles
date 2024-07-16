import i3ipc

useWindowTitleList = ["Alacritty"]


def get_name(window, workspaceNum):
    nameValue = window.window_class
    if nameValue == "Alacritty":
        nameValue = window.window_title
    newName = "{}: {}".format(
        workspaceNum, nameValue)
    if len(newName) > 20:
        return newName[:20] + ".."
    return newName


def rename(i3, e):
    workspaces = i3.get_tree().workspaces()
    commands = []
    for workspace in workspaces:
        windows = workspace.leaves()
        if len(windows) == 0:
            newName = str(workspace.num)
        else:
            newName = workspace.name
            for window in windows:
                if len(windows) > 1:
                    if window.focused:
                        newName = get_name(window, workspace.num)
                else:
                    newName = get_name(window, workspace.num)

        if workspace.name != newName:
            commands.append('rename workspace "{}" to "{}"'.format(
                # escape any double quotes in old or new name.
                workspace.name.replace('"', '\\"'), newName.replace('"', '\\"')))
    # we have to join all the activate workspaces commands into one or the order
    # might get scrambled by multiple i3-msg instances running asyncronously
    # causing the wrong workspace to be activated last, which changes the focus.
    i3.command(u';'.join(commands))


def main():
    # build i3-connection
    i3 = i3ipc.Connection()
    for case in ['window::focus', 'window::move', 'window::new', 'window::title', 'window::close']:
        i3.on(case, rename)
    i3.main()


if __name__ == '__main__':
    main()

