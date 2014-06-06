import os
import matplotlib.pyplot as plt

def save(pathname='./figure', ext='png', close=True, verbose=True, vdpi=100):
    """Save a figure from pyplot.

    Parameters
    ----------
    pathname : string (default='./figure')
        The path name (and filename, without extension) to save the
        figure to.

    ext : string (default='png')
        The file extension. This must be supported by the active
        matplotlib backend (see matplotlib.backends module).  Most
        backends support 'png', 'pdf', 'ps', 'eps', and 'svg'.

    close : boolean (default=True)
        Whether to close the figure after saving.  If you want to save
        the figure multiple times (e.g., to multiple formats), you
        should NOT close it in between saves or you will have to
        re-plot it.

    verbose : boolean (default=True)
        Whether to print information about when and where the image
        has been saved.

	vdpi : integer (default=100)
		DPI value for saved figure.

    """
    
    # Extract the directory and filename from the given path, resolve tilde '~' path on linux
    directory = os.path.split(os.path.expanduser(pathname))[0]
    filename  = "%s.%s" % (os.path.split(pathname)[1], ext)
    if directory == '':
        directory = '.'

    # If the directory does not exist, create it
    if not os.path.exists(directory):
        os.makedirs(directory)

    # The final path to save to
    savetopath = os.path.join(directory, filename)

    if verbose:
        print("Saving figure to '%s'..." % savetopath),

    # Actually save the figure
    plt.savefig(savetopath, dpi=vdpi)
    
    # Close it
    if close:
        plt.close()

    if verbose:
        print("Done")
