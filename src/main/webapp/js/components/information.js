const tabsLi = document.querySelectorAll('.info-tab li');
const tabContent = document.querySelectorAll('form');

tabsLi.forEach((li) => {
    li.addEventListener('click', (e) => {
        const tab = e.target.dataset.tab;
        const tabContent = document.querySelector(`.info-tab-content-${tab}`);
        toggleTabActive(li);
        toggleInfoActive(tabContent);
    });
});

const toggleTabActive = (tab) => {
    tabsLi.forEach((li) => {
        li.classList.remove('tab-active');
    });
    tab.classList.add('tab-active');
};

const toggleInfoActive = (info) => {
    tabContent.forEach((content) => {
        content.classList.remove('info-active');
        content.classList.add('info-hide');
    });
    info.classList.remove('info-hide');
    info.classList.add('info-active');
};