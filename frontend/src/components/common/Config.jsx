import i18n from '../../i18n/index';

export const apiUrl = import.meta.env.VITE_API_URL;
const userInfo = localStorage.getItem('userInfoLms')
export const token = userInfo ? JSON.parse(userInfo).token : null

export function convertMinutesToHours(minutes) {
    const t = i18n.t.bind(i18n);
    let hours = Math.floor(minutes / 60);
    let remainingMinutes = minutes % 60;

    if (hours > 0) {
        let hString = hours === 1 ? t("time.hr") : t("time.hrs");
        let mString = remainingMinutes === 1 ? t("time.min") : t("time.mins");

        if (remainingMinutes > 0) {
            return `${hours}${hString} ${remainingMinutes}${mString}`;
        } else {
            return `${hours}${hString}`;
        }
    } else {
        if (remainingMinutes > 0) {
            let mString = remainingMinutes === 1 ? t("time.min") : t("time.mins");
            return `${remainingMinutes}${mString}`;
        }
    }

    return `0${t("time.min")}`;
}