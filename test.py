import tkinter
import random
import time
import threading 
import tk 
def boom():
    window = tk.Tk()
    width = window.winfo_screenwidth()
    height = window.winfo_screenheight()
    a = random.randrange(0, width)
    b = random.randrange(0, height)
    window.title('嘿嘿')
    window.geometry("200x50" + "+" + str(a) + "+" + str(b))
    tk.Label(window, text='你是一个傻狍子', bg='green',
    font=('宋体', 17), width=20, height=4).pack()
    window.mainloop()
time.sleep(1)
 
 
 
threads = []
for i in range(25):#可以调整括号内的数字，数字代表出现窗口的数量
    t = threading.Thread(target=boom)
    threads.append(t)
    time.sleep(0)#调整出现速度
    threads[i].start()