import os, sys
import csv

exts = ['.java', '.xml']
count_empty_line = True
here = '/Users/ibrahim/Desktop/MyCapstone/Tags/'


def read_line_count(fname):
    count = 0
    for line in open(fname).readlines():
        if count_empty_line or len(line.strip()) > 0:
            count += 1
    return count


if __name__ == '__main__':
    line_count = 0
    file_count = 0
    files = os.listdir(os.curdir)
    dirlist = [item for item in os.listdir(here) if os.path.isdir(os.path.join(here, item))]

    # all the man folders
    for folder in dirlist:
        print('==============')
        print 'App Name: ', folder
        print('==============')
        # line_count = 0
        # file_count = 0

        main_folder = here+folder + '/'

        dirlist2 = [item for item in os.listdir(main_folder) if os.path.isdir(os.path.join(main_folder, item))]

        for subFolder in dirlist2:
            print('==============')
            print 'Release:', subFolder
            print('==============')
            line_count = 0
            file_count = 0

            for base, dirs, files in os.walk(main_folder+subFolder):
                for file in files:
                    # Check the subdirectorys
                    if file.find('.') < 0:
                        continue
                    ext = (file[file.rindex('.'):]).lower()

                    try:
                        if exts.index(ext) >= 0:
                            file_count += 1
                            path = (base + '/' + file)
                            c = read_line_count(path)
                            line_count += c


                    except:
                        pass
            print 'File count : %d' % file_count
            print 'Line count : %d' % line_count

            with open('res.csv', "a") as csv_file:
                writer = csv.writer(csv_file)
                writer.writerow((folder, subFolder, file_count))

